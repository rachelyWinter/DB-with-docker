FROM mcr.microsoft.com/mssql/server:2019-latest

# Set environment variables
ENV SA_PASSWORD=Foir100#
ENV ACCEPT_EULA=Y

# Expose port 1433
EXPOSE 1433

# Create a volume for SQL Server data
VOLUME /var/opt/mssql

USER root
RUN chown -R mssql /var/opt/mssql
RUN chmod 777 /opt/mssql/bin/sqlservr && \
    chown -R mssql /var/opt/mssql
ENV MSSQL_PID=Express

    # Create a directory for backup files and set permissions
#RUN mkdir -p /var/opt/mssql/backup && \
#    chmod 777 /var/opt/mssql/backup
    
#USER mssql

# Start SQL Server
CMD /opt/mssql/bin/sqlservr
