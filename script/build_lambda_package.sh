# cd iac

PACKAGE=package

if [ -d $PACKAGE]
then
    echo "O Diretorio $PACKAGE já existe"
else
    echo "########################################"
    echo "Criando o diretorio $PACKAGE ....."
    mkdir $PACKAGE
    echo "O diretorio $PACKAGE foi criado"
    echo "########################################"
fi


FILE_REQUIREMENTS=../etl/lambda_requirements.txt


if [ -f $FILE_REQUIREMENTS ]
then

    echo "Instalando depencias localizadas no $FILE_REQUIREMENTS"
    pip install -target ./package -r $FILE_REQUIREMENTS
    echo "Dependencias instaladas com sucesso"
    echo "########################################"
else

    echo "Não localizado $FILE_REQUIREMENTS"
    echo "########################################"
fi


cd $PACKAGE

LAMBDA_FUNCTION=../etl/lambda_function.py

if [ -f `$LAMBDA_FUNCTION`]
then
    echo "########################################"
    echo "Copiando funcao Handler "
    cp $LAMBDA_FUNCTION .
    echo "Compactando arquivo lambda_function_payload.zip"
    zip -r9 ../lambda_function_payload.zip
    echo "Arquivo compactando com sucesso"
    echo "########################################"
fi

cd ..
