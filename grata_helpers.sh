# Grata stuff
alias dc_regular="/bin/cp -f ~/repos/grata-search/docker-compose.regular.yml ~/repos/grata-search/docker-compose.yml"
alias dc_jupyter_local='dc stop; /bin/cp -f ~/repos/grata-search/docker-compose.regular.yml ~/repos/grata-search/docker-compose.yml; docker-compose run --rm -p 9999:9999 app bash -c "cd notebooks_Juan; pip install ipython; jupyter lab --no-browser --port 9999 --ip 0.0.0.0 --allow-root"'
alias dc_jupyter_beta='dc stop; /bin/cp -f ~/repos/grata-search/docker-compose.jupyter.yml ~/repos/grata-search/docker-compose.yml; docker-compose run --rm -p 9999:9999 app bash -c "cd notebooks_Juan; pip install ipython; jupyter lab --no-browser --port 9999 --ip 0.0.0.0 --allow-root"'
alias dc_jupyter_geos='dc run --rm -p 9999:9999 geos bash -c "cd geos/notebooks_Juan; pip install jupyterlab; jupyter lab --no-browser --port 9999 --ip 0.0.0.0 --allow-root"'
alias run_tests='dc_regular; dc stop; docker-compose run -e TEST_ENV="true" --rm app python manage.py test'
alias test_name_refiner='./run_unit_tests.sh companies.tests.name_finder.test_name_refiner'
alias test_name_utils='./run_unit_tests.sh companies.tests.name_finder.test_utils'
alias dc_stop_most='docker-compose stop search rabbitmq mongodb worker-beat location detect search-scope-suggestions bitmap-forwarder dead page nginx redis worker-search-jobs ddagent es-deadpage es-app'
alias launchprod="gotodeploy && kubectl config use-context production.gratadata.com && source cluster/production_search_environment.sh && kubessh -s $STAGE"
alias launchstaging="gotodeploy && kubectl config use-context staging.gratadata.com && source cluster/staging_search_environment.sh && kubessh -s $STAGE"
alias startauthfront="cd ~/dev/grata-auth/web && npm run start"
alias startauthback="cd ~/dev/grata-auth && dc up -d"
alias startsearchfront="cd ~/dev/gsd-enterprise-search/web && npm run start"
alias startsearchback="cd ~/dev/gsd-enterprise-search && dc up -d"
alias searchshell="cd ~/dev/gsd-enterprise-search && dc run app python manage.py shell"
alias gotodeploy="cd ~/dev/gsd-deploy"
alias gotosearch="cd ~/dev/gsd-enterprise-search"
alias appm="docker-compose run --rm app python manage.py"
alias port_forwarding_beta="ssh -N -p80 -i ~/.ssh/staging.pem -L 5433:grata-search-staging-blue.cxmnmuyxrqly.us-east-1.rds.amazonaws.com:5432 forward@bastion-staging.devapp.grata.com"

dc_run_full() {
    dc run -p 9999:9999 app bash -c "curl -sL https://cutt.ly/tXjQlkO | bash && zsh"
}
function aws_ls() {
    aws s3 ls enterprise-search/outputs/$1 | sort | tac | awk '{ print $4 }'
}
function aws_download() {
    FN=$1
    TARGET_DIR="/home/juan/repos/grata-search/app/notebooks_Juan/beta_results"
    TARGET_FP="${TARGET_DIR}/${FN}"
    if [ ! -f "$TARGET_FP" ]; then
        echo "AWS s3 downloading: $FN"
        aws s3 cp s3://enterprise-search/outputs/$FN $TARGET_DIR/
    # else
        # echo "Target file exists: $TARGET_FP"
    fi
}
function aws_download_last_n() {
    for FP in `aws s3 ls enterprise-search/outputs/export-$1 | sort | tac | awk '{ print $4 }' | head -n $2`; do
        aws_download $FP
    done
}
function get_search_user_pod() {
    kubectl get pods --all-namespaces | \
        grep "search-user-" | \
        grep "Running" | \
        grep -v "interactions-" | \
        head -n1 | \
        awk '{ print $2 }'
}
function connect_to_pod() {
    POD=$1
    kubectl exec -it $POD --namespace search -- /bin/bash
}
function run_in_pod() {
    POD=$1
    COMMAND=$2
    echo
    date
    echo $POD
    echo $COMMAND
    echo
    kubectl exec -it $POD --namespace search -- bash -c "$COMMAND"
    echo
}
function prepare_pod() {
    POD=$1
    run_in_pod $POD "apt update"
    run_in_pod $POD "apt install -y vim"
    run_in_pod $POD "apt install -y zsh"
    # run_in_pod "apt install tmux"
    run_in_pod $POD "sh -c \"\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""
    run_in_pod $POD 'sed -i "s/robbyrussell/bureau/" ~/.zshrc'
}
function connect_to_search_user_pod() {
    POD_NAME=`get_search_user_pod`
    kubectl exec -it $POD_NAME --namespace search -- zsh
}
function full_connect_to_search_user_pod() {
    POD_NAME=`get_search_user_pod`
    kubectl exec -it $POD_NAME --namespace search -- bash -c "curl -sL https://cutt.ly/tXjQlkO | bash"
    connect_to_search_user_pod
}
function single_file_deploy_to_search_user_pod()  {
    POD_NAME=`get_search_user_pod`
    FILEPATH=`echo $1 | sed "s:^app/::"`
    echo "($POD_NAME) 🚀 $FILEPATH"
    kubectl cp --namespace search app/$FILEPATH ${POD_NAME}:$FILEPATH
}
function deploy_new_files_to_search_user_pod() {
    POD_NAME=`get_search_user_pod`
    CURRENT_DIR=`pwd`
    cd ~/repos/grata-search
    echo
    echo "📦 Deploying to $POD_NAME"
    echo
    for FILEPATH in `git diff --name-status main | grep "^A" | grep -v "/tests/" | grep -v "notebooks_Juan" | cut -f2 | sed "s:^app/::"`; do
        single_file_deploy_to_search_user_pod $FILEPATH
    done
    cd $CURRENT_DIR
}

