FROM mcr.microsoft.com/mssql/server:2019-latest

# Set environment variables
ENV SA_PASSWORD=Foir100#
ENV ACCEPT_EULA=Y

# Expose port 1433
EXPOSE 1433

# Create a volume for SQL Server data
VOLUME /var/opt/mssql

# Start SQL Server
CMD /opt/mssql/bin/sqlservr
