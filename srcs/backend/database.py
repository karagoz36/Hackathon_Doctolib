from sqlalchemy.orm import sessionmaker
from sqlalchemy import create_engine
from sqlalchemy.ext.declaration import declaration_base


URL_DATABSE ='postgresql://$POSTGRES_USER:$POSTGRES_PASSWORD@localhost/dbname'

engine = create_engine(URL_DATABSE)
sessionLocal = sessionmaker(autocommit= False, autoflush=False, bind=engine)

Base = declaration_base()

