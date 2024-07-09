# Use the official Microsoft SQL Server image from the Docker Hub
FROM mcr.microsoft.com/mssql/server:2019-latest

# Set environment variables for the SQL Server
ENV ACCEPT_EULA=Y
ENV MSSQL_SA_PASSWORD=Foir100#
ENV MSSQL_PID=Express

# Create a directory for backup files and set permissions
RUN mkdir -p /var/opt/mssql/backups && \
    chmod 777 /var/opt/mssql/backups

# Copy the backup file into the container
COPY liberiansDB_single.bak /var/opt/mssql/backups/

# Expose the SQL Server port
EXPOSE 1433

# Start SQL Server and restore the database
CMD /bin/bash -c "/opt/mssql/bin/sqlservr & sleep 30 && /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 'Foir100#' -Q 'RESTORE DATABASE [liberiansDB] FROM DISK = \"/var/opt/mssql/backups/liberiansDB_single.bak\" WITH MOVE \"liberiansDB_Data\" TO \"/var/opt/mssql/data/liberiansDB.mdf\", MOVE \"liberiansDB_Log\" TO \"/var/opt/mssql/data/liberiansDB.ldf\"'"
