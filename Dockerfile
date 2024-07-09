FROM mcr.microsoft.com/mssql/server:2019-latest

# הגדרת משתני הסביבה
ENV SA_PASSWORD="Foir100#"
ENV ACCEPT_EULA="Y"

# יצירת תיקיות נתונים וגיבויים בתוך התמונה
RUN mkdir -p /var/opt/mssql/data
RUN mkdir -p /var/opt/mssql/backups

# העתקת קבצי הנתונים הנוכחיים לתוך התמונה
COPY ./data /var/opt/mssql/data
COPY ./backups /var/opt/mssql/backups

RUN find /var/opt/mssql/data -type d -exec chmod 755 {} \;
RUN find /var/opt/mssql/backups -type d -exec chmod 755 {} \;

# חשיפת הפורט 1433
EXPOSE 1433

USER mssql
# הגדרת פקודת ההפעלה של הקונטיינר
CMD ["/opt/mssql/bin/sqlservr"]

