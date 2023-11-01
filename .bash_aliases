# Alias for clearing the terminal screen
alias cls='clear'
alias aws='docker run --rm -ti -v ~/.aws:/root/.aws -v $(pwd):/aws amazon/aws-cli'
alias azd='docker run --rm -ti -v ~/.azure:/root/.azure -v $(pwd):/azure mcr.microsoft.com/azure-cli'

# Setup Azure account variables
AZUREDEV="Jayride-Pay-As-You-Go Dev/Test"
AZUREPROD="Jayride-Production-Pay-As-You-Go"


learningGolang() {
    cd ~/data/LearningGolang
    docker run -it --rm -v $(pwd):/go/src/work go 
}