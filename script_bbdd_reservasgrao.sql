    -- Creación de la tabla RGR_MESA

        CREATE TABLE RGR_MESA(

            ID_RGR_MESA NUMBER(6),
            MES_TIPO VARCHAR(3) NOT NULL,
            MES_NMESA NUMBER(5) NOT NULL,
            MES_FECHA_BAJA DATE,
            CONSTRAINT CHK_ENUM_TIPO CHECK (MES_TIPO='est' OR MES_TIPO='tra')

        );

        
        --Primary key

            ALTER TABLE RGR_MESA ADD CONSTRAINT PK_RGR_MESA PRIMARY KEY (ID_RGR_MESA);


        -- Secuencia

            CREATE SEQUENCE SEQ_RGR_MESA START WITH 1 INCREMENT BY 1;


        --Comentarios

            COMMENT ON TABLE RGR_MESA IS 'Tabla que almacena la información de la mesa - RGR significa Reservas Grao - MES es la abreviación del nombre de la tabla';
            COMMENT ON COLUMN RGR_MESA.ID_RGR_MESA IS 'Identificador de la mesa';
            COMMENT ON COLUMN RGR_MESA.MES_TIPO IS 'Tipo de la mesa: "est" significa que es una mesa para estudio y "tra" significa que es para trabajar, por lo que tiene un pc';
            COMMENT ON COLUMN RGR_MESA.MES_NMESA IS 'Número de mesa';
            COMMENT ON COLUMN RGR_MESA.MES_FECHA_BAJA IS 'Fecha en la que se dio de baja la mesa, si está en null significa que la mesa sigue activa';


    -- Creación de la tabla RGR_HORARIO

        CREATE TABLE RGR_HORARIO(

            ID_RGR_HORARIO NUMBER(6),
            HOR_HORA_INICIO VARCHAR(5) NOT NULL,
            HOR_HORA_FIN VARCHAR(5) NOT NULL

        );

        -- Primary key

            ALTER TABLE RGR_HORARIO ADD CONSTRAINT PK_RGR_HORARIO PRIMARY KEY (ID_RGR_HORARIO);

        -- Secuencia

            CREATE SEQUENCE SEQ_RGR_HORARIO START WITH 1 INCREMENT BY 1;


        -- Comentarios

            COMMENT ON TABLE RGR_HORARIO IS 'Tabla para almacenar el horario de las reservas - RGR significa Reservas Grao - HOR es la abreviación del nombre de la tabla';
            COMMENT ON COLUMN RGR_HORARIO.ID_RGR_HORARIO IS 'Identificador de la hora';
            COMMENT ON COLUMN RGR_HORARIO.HOR_HORA_INICIO IS 'Hora de inicio de la reserva';
            COMMENT ON COLUMN RGR_HORARIO.HOR_HORA_FIN IS 'Hora de fin de la reserva';

    -- Creación de la tabla RGR_RESERVA

        CREATE TABLE RGR_RESERVA(

            ID_RGR_RESERVA NUMBER(6),
            RES_ID_RGR_USUARIO NUMBER(6) NOT NULL,
            RES_ID_RGR_MESA NUMBER(6) NOT NULL,
            RES_ID_RGR_HORARIO NUMBER(6) NOT NULL,
            RES_FECHA_RESERVA DATE NOT NULL,
            RES_FECHA_CREACION DATE NOT NULL

        );

        -- Primary key

            ALTER TABLE RGR_RESERVA ADD CONSTRAINT PK_RGR_RESERVA PRIMARY KEY (ID_RGR_RESERVA);
        
        -- Foreign key

            ALTER TABLE RGR_RESERVA ADD CONSTRAINT FK_RES_ID_RGR_MESA FOREIGN KEY (RES_ID_RGR_MESA) REFERENCES RGR_MESA(ID_RGR_MESA);
            ALTER TABLE RGR_RESERVA ADD CONSTRAINT FK_RES_ID_RGR_HORARIO FOREIGN KEY (RES_ID_RGR_HORARIO) REFERENCES RGR_HORARIO(ID_RGR_HORARIO);
        
        -- Unique

            ALTER TABLE RGR_RESERVA ADD CONSTRAINT UNQ_ID_USU_FECHA_HORA UNIQUE (RES_ID_RGR_USUARIO, RES_FECHA_RESERVA, RES_ID_RGR_HORARIO);
            ALTER TABLE RGR_RESERVA ADD CONSTRAINT UNQ_ID_MESA_FECHA_HORA UNIQUE (RES_ID_RGR_MESA, RES_FECHA_RESERVA, RES_ID_RGR_HORARIO);
        
        -- Secuencia

            CREATE SEQUENCE SEQ_RGR_RESERVA START WITH 1 INCREMENT BY 1;
        
        
        -- Comentarios

            COMMENT ON TABLE RGR_RESERVA IS 'Tabla donde se almacenan las reservas hechas por los usuarios - RGR significa Reservas Grao - RES es la abreviación del nombre de la tabla';
            COMMENT ON COLUMN RGR_RESERVA.ID_RGR_RESERVA IS 'Identificador de la reserva';
            COMMENT ON COLUMN RGR_RESERVA.RES_ID_RGR_USUARIO IS 'Identificador del usuario que realiza la reserva';
            COMMENT ON COLUMN RGR_RESERVA.RES_ID_RGR_MESA IS 'Identificador de la mesa que se ha reservado';
            COMMENT ON COLUMN RGR_RESERVA.RES_ID_RGR_HORARIO IS 'Identificador de la hora que se ha reservado esa mesa';
            COMMENT ON COLUMN RGR_RESERVA.RES_FECHA_RESERVA IS 'Fecha de la reserva';
            COMMENT ON COLUMN RGR_RESERVA.RES_FECHA_CREACION IS 'Fecha en la que se creó la reserva';



    -- Creación de la tabla RGR_PARAMETRO

        CREATE TABLE RGR_PARAMETRO(

            ID_RGR_PARAMETRO VARCHAR(15),
            PRM_VALOR NUMBER(20)
        );

        -- Primary key

            ALTER TABLE RGR_PARAMETRO ADD CONSTRAINT PK_RGR_PARAMETRO PRIMARY KEY (ID_RGR_PARAMETRO);
        
        -- Comentarios

            COMMENT ON TABLE RGR_PARAMETRO IS 'Tabla donde se almacenan valores de parametros - RGR significa Reservas Grao - PRM es la abreviación del nombre de la tabla';
            COMMENT ON COLUMN RGR_PARAMETRO.ID_RGR_PARAMETRO IS 'Identificador del parámetro';
            COMMENT ON COLUMN RGR_PARAMETRO.PRM_VALOR IS 'Valor del parámetro';
    

    -- Creación de la tabla RGR_FESTIVO

        CREATE TABLE RGR_FESTIVO(

            ID_RGR_FESTIVO NUMBER(6),
            FST_FECHA DATE,
            FST_ANYO VARCHAR(4)
        );

        -- Primary key

            ALTER TABLE RGR_FESTIVO ADD CONSTRAINT PK_RGR_FESTIVO PRIMARY KEY (ID_RGR_FESTIVO);
        
        -- Secuencia

            CREATE SEQUENCE SEQ_RGR_FESTIVO START WITH 1 INCREMENT BY 1;


        -- Comentarios

            COMMENT ON TABLE RGR_FESTIVO IS 'Tabla donde se almacenan los días festivos - RGR significa Reservas Grao - FST es la abreviación del nombre de la tabla';
            COMMENT ON COLUMN RGR_FESTIVO.ID_RGR_FESTIVO IS 'Identificador del festivo';
            COMMENT ON COLUMN RGR_FESTIVO.FST_FECHA IS 'Fecha del día festivo';
            COMMENT ON COLUMN RGR_FESTIVO.FST_ANYO IS 'Año del día festivo - campo para poder filtrar facilmente los festivos por año';


--Funciones

    --Función para comprobar si el usuario puede crear o no más reservas en x día teniendo en cuenta el limite de reservas en cada día
        create or replace FUNCTION FU_COMPRUEBA_RESERVAS_USU_DIA(ID_USU VARCHAR2, FECHA_RESERVA DATE)
        RETURN NUMBER IS 
            RESERVAS_USU_DIA NUMBER;
            MAX_RESERVAS_DIA NUMBER;
            BOOL NUMBER;

        BEGIN 
            --Selecciona el número de reservas del usuario por parametro en el día por parametro
            select count(*) INTO RESERVAS_USU_DIA 
                from RGR_RESERVA 
                where RES_ID_RGR_USUARIO = ID_USU
                and RES_FECHA_RESERVA = FECHA_RESERVA;
    
            --Selecciona el máximo de reservas en un día por usuario de la tabla de parametros
            select PRM_VALOR INTO MAX_RESERVAS_DIA
                FROM RGR_PARAMETRO 
                WHERE ID_RGR_PARAMETRO = 'MAX_RESERVAS_DIA';

            --Si las reservas del usuario en el dia son iguales o mayores al límite devuelve 1, sino 0
            IF RESERVAS_USU_DIA >= MAX_RESERVAS_DIA THEN
                BOOL := 1;
            ELSE
                BOOL := 0;
            END IF;
            RETURN(BOOL); 
        END FU_COMPRUEBA_RESERVAS_USU_DIA;
        /


    --Función para comprobar si el usuario puede crear o no más reservas teniendo en cuenta el límite de reservas pendientes
        create or replace FUNCTION FU_COMPRUEBA_RESERVAS_USU_TOTAL(ID_USU VARCHAR2)
        RETURN NUMBER IS 
            RESERVAS_USU NUMBER;
            MAX_RESERVAS NUMBER;
            BOOL NUMBER;
        BEGIN 

            --Selecciona el número de reservas pendientes del usuario
            select count(*) INTO RESERVAS_USU 
                from RGR_RESERVA 
                where RES_ID_RGR_USUARIO = ID_USU
                and RES_FECHA_RESERVA >= TRUNC(SYSDATE);
    
            --Selecciona el máximo de reservas por usuario de la tabla de parametros
            select PRM_VALOR INTO MAX_RESERVAS
                FROM RGR_PARAMETRO 
                WHERE ID_RGR_PARAMETRO = 'MAX_RESERVAS_TOTALES';

            --Si las reservas del usuario son iguales o mayores al límite devuelve 1, sino 0
            IF RESERVAS_USU >= MAX_RESERVAS THEN
                BOOL := 1;
            ELSE
                BOOL := 0;
            END IF;
        RETURN(BOOL); 
        END FU_COMPRUEBA_RESERVAS_USU_TOTAL;
        /


    --Función que devuelve la fecha máxima en la que se puede reservar teniendo en cuenta el parametro de alcance de días disponibles
        create or replace FUNCTION FU_ALCANCE_DIAS_DISPONIBLES
        RETURN DATE IS 
            DIAS NUMBER;
        BEGIN 
    
            --Selecciona el valor de dias disponibles de la tabla de parametros
            select PRM_VALOR INTO DIAS
                FROM RGR_PARAMETRO 
                WHERE ID_RGR_PARAMETRO = 'ALCANCE_DIAS_DISPONIBLES';

        RETURN(TRUNC(SYSDATE)+DIAS); 
        END FU_ALCANCE_DIAS_DISPONIBLES;
        /


    ----Funcion que devuelve 1 si la fecha y hora de la reserva ya ha pasado y 0 si aun es posible reservar en esa hora
        create or replace FUNCTION FU_COMPRUEBA_HORAS_PASADAS(FECHA_RESERVAR DATE, HORA_RESERVAR VARCHAR2, FECHA_ACTUAL DATE)
        RETURN NUMBER IS 
            FECHA_CONSULTA DATE;
            BOOL NUMBER;
        BEGIN 
            --A la variable fecha consulta le asigno el valor de la fecha de la reserva con la hora de inicio de la reserva
            FECHA_CONSULTA := to_date((TO_CHAR(FECHA_RESERVAR, 'DD/MM/RRRR') || ' ' || HORA_RESERVAR), 'DD/MM/RRRR HH24:MI');

            --Comparo fecha y hora actual con la de la reserva
            IF FECHA_CONSULTA < FECHA_ACTUAL THEN
                BOOL := 1;
            ELSE
                BOOL := 0;
            END IF;
        RETURN(BOOL); 
        END FU_COMPRUEBA_HORAS_PASADAS;
        /

        --Funcion que devuelve 1 si el día es festivo
        create or replace FUNCTION FU_COMPRUEBA_FESTIVO(FECHA_RESERVA DATE)
        RETURN NUMBER IS 
            v_cuenta NUMBER;
            BOOL NUMBER;
        BEGIN 

            v_cuenta := 0;

            --Compruebo si el dia es festivo
            select count(*)
                into v_cuenta
                from RGR_FESTIVO
                where trunc(FST_FECHA) = trunc(FECHA_RESERVA)
                and rownum = 1;

            IF v_cuenta != 0 THEN
                BOOL := 1;
            ELSE
                BOOL := 0;
            END IF;
        RETURN(BOOL); 
        END FU_COMPRUEBA_FESTIVO;
        /

        --Funcion que devuelve 1 si el día es FIN DE SEMANA
        create or replace FUNCTION FU_COMPRUEBA_FIN_DE_SEMANA(FECHA_RESERVA DATE)
        RETURN NUMBER IS 
            DIA_SEMANA VARCHAR2(3);
            BOOL NUMBER;
        BEGIN 
            
            --Convierto la fecha en un caracter con el valor de el día de la semana
            DIA_SEMANA := to_char(FECHA_RESERVA, 'D');


            --Compruebo si es sábado o domingo
            IF DIA_SEMANA in ('6', '7') THEN
                BOOL := 1;
            ELSE
                BOOL := 0;
            END IF;
        RETURN(BOOL); 
        END FU_COMPRUEBA_FIN_DE_SEMANA;
        /


-- Triggers

        -- Triggers de  la tabla RGR_MESA

            -- ID autogenerado:
            create or replace trigger TRG_GENERA_ID_RGR_MESA BEFORE insert on RGR_MESA
                for each row

                begin
                    :NEW.ID_RGR_MESA := SEQ_RGR_MESA.NEXTVAL;
                end;
            /


            --Tigger que actúa como unique en el número de mesa, afectando solo a las mesas activas
            create or replace trigger TRG_UNQ_NMESA_ACTIVA BEFORE insert on RGR_MESA
                for each row
                declare
                v_cuenta NUMBER;

            BEGIN

                v_cuenta := 0;

                --Compruebo si el nuevo número de mesa lo tiene alguna mesa activa, si es así, da error.

                Select count(*) INTO v_cuenta 
                    from RGR_MESA 
                    WHERE MES_FECHA_BAJA IS NULL 
                    AND MES_NMESA = :NEW.MES_NMESA;

        
                IF v_cuenta != 0 THEN
                    RAISE_APPLICATION_ERROR(-20000, 'Ese número de mesa ya existe en una mesa activa, prueba con otro número');
                END IF;
            END;
            /



        -- Triggers de la tabla RGR_HORARIO

            -- ID autogenerado:
            create or replace trigger TRG_GENERA_ID_RGR_HORARIO 
            BEFORE insert on RGR_HORARIO
            for each row

            begin
                :NEW.ID_RGR_HORARIO := SEQ_RGR_HORARIO.NEXTVAL;
            end;
            /


        -- Triggers de la tabla RGR_RESERVA

            -- ID autogenerado y fecha:
            create or replace trigger TRG_GENERA_ID_RGR_RESERVA 
            BEFORE insert on RGR_RESERVA
            for each row

            begin
                :NEW.ID_RGR_RESERVA := SEQ_RGR_RESERVA.NEXTVAL;
                :NEW.RES_FECHA_CREACION := TO_DATE(TRUNC(SYSDATE), 'MM/DD/RRRR');
            end;
            /


            --Límite de reservas por día para cada usuario
            create or replace trigger TRG_MAX_RESERVAS_USU_DIA BEFORE insert on RGR_RESERVA
            for each row
            begin
                --Funcion que devuelve 1 si el usuario está en el limite de reservas de x día
                IF FU_COMPRUEBA_RESERVAS_USU_DIA(:NEW.RES_ID_RGR_USUARIO, :NEW.RES_FECHA_RESERVA) = 1 THEN
                    RAISE_APPLICATION_ERROR(-20000, 'Un usuario no puede tener más de dos reservas en un mismo día');
                END IF;
            end;
            /


            --Límite de reservas por usuario
            create or replace trigger TRG_MAX_RESERVAS_USU_TOTAL BEFORE insert on RGR_RESERVA
            for each row
            begin
                --Funcion que devuelve 1 si el usuario está en el limite de reservas pendientes
                IF FU_COMPRUEBA_RESERVAS_USU_TOTAL(:NEW.RES_ID_RGR_USUARIO) = 1 THEN
                    RAISE_APPLICATION_ERROR(-20000, 'El usuario ha alcanzado el límite de reservas pendientes');
                END IF;
            end;
            /


            --Reserva en días disponibles
            create or replace trigger TRG_RANGO_DIAS_DISPONIBLES BEFORE insert on RGR_RESERVA
            for each row
            declare
                FECHA_MAX DATE;

            begin
                --Funcion que devuelve 1 si el usuario está en el limite de reservas de x día
                FECHA_MAX := FU_ALCANCE_DIAS_DISPONIBLES;

                --Comprobación dias anteriores
                IF :NEW.RES_FECHA_RESERVA < TRUNC(SYSDATE) THEN
                    RAISE_APPLICATION_ERROR(-20000, 'No se pueden reservar días anteriores al actual');
                END IF;

                --Comprobacion de dias fuera de la fecha máxima
                IF :NEW.RES_FECHA_RESERVA > FECHA_MAX THEN
                    RAISE_APPLICATION_ERROR(-20000, 'No se pueden reservar días tan lejanos, la fecha límite actual es: ' || FECHA_MAX);
                END IF;
            end;
            /
            

            --Trigger que comprueba que no se reserven sábados o domingos.
            create or replace trigger TRG_NO_FIN_DE_SEMANA BEFORE insert on RGR_RESERVA
            for each row
            begin
        
                IF FU_COMPRUEBA_FIN_DE_SEMANA(:NEW.RES_FECHA_RESERVA) = 1 THEN
                    RAISE_APPLICATION_ERROR(-20000, 'No se puede reservar un fin de semana.');
                END IF;
            end;
            /

            --Trigger que comprueba que no se reserven festivos
            create or replace trigger TRG_NO_FESTIVO BEFORE insert on RGR_RESERVA
            for each row
            begin
        
                IF FU_COMPRUEBA_FESTIVO(:NEW.RES_FECHA_RESERVA) = 1 THEN
                    RAISE_APPLICATION_ERROR(-20000, 'No se puede reservar en día festivo.');
                END IF;
            end;
            /


        -- Triggers de la tabla RGR_FESTIVO

            -- ID autogenerado:
            create or replace trigger TRG_GENERA_ID_RGR_FESTIVO
            BEFORE insert on RGR_FESTIVO
            for each row

            begin
                :NEW.ID_RGR_FESTIVO := SEQ_RGR_FESTIVO.NEXTVAL;
            end;
            /


--Procedimientos

    --Procedimiento utilizado cuando se da de baja una mesa para avisar al usuario y cancelar sus reservas pendientes  con esa mesa.
        create or replace PROCEDURE PRO_BAJA_MESA(id_mesa NUMBER)
        IS
            --Creo un cursor que recorrerá los usuarios que tienen reservas pendientes con la mesa que se está dando de baja
            CURSOR c1
                IS
                select distinct RES_ID_RGR_USUARIO from RGR_RESERVA, RGR_HORARIO
                    where RES_ID_RGR_HORARIO = ID_RGR_HORARIO
                    AND (to_date((to_char(RES_FECHA_RESERVA, 'DD/MM/RRRR') || ' ' || HOR_HORA_INICIO), 'DD/MM/RRRR HH24:MI') 
                    > current_date)
                    AND (RES_ID_RGR_MESA = id_mesa);
    
            num_mesa NUMBER;
        BEGIN

            select MES_NMESA into num_mesa from RGR_MESA WHERE ID_RGR_MESA = id_mesa;

            --Recorro el cursor 
            FOR record IN c1
                LOOP
            
                    --Envío un correo electronico para avisar al usuario
                    APEX_MAIL.SEND(p_from => 'reservasgrao@apex.com',
                        p_to   => record.RES_ID_RGR_USUARIO,
                        p_subj => 'Reserva cancelada',
                        p_body => 'Ha sucedido algo con la mesa ' || num_mesa ||  ', con la que tenías reservas pendientes, y debido a esto, se han cancelado dichas reservas. ' ||
                        'Por favor, revisalo para volver a reservar otra mesa si lo deseas');

                    --Elimino sus reservas pendientes para esa mesa
                    DELETE FROM RGR_RESERVA WHERE ID_RGR_RESERVA IN (
                        SELECT ID_RGR_RESERVA 
                        FROM RGR_RESERVA, RGR_HORARIO
                        WHERE RES_ID_RGR_HORARIO = ID_RGR_HORARIO
                        AND (to_date((to_char(RES_FECHA_RESERVA, 'DD/MM/RRRR') || ' ' || HOR_HORA_INICIO), 'DD/MM/RRRR HH24:MI') 
                        > current_date)
                        AND (RES_ID_RGR_MESA = id_mesa)
                        AND RES_ID_RGR_USUARIO = record.RES_ID_RGR_USUARIO
                    );
            END LOOP;
        END;
        /