# 📋 Local Setup Instructions

## Prerequisites Check

```powershell
# Check Node.js
node --version  # Should be v20+
npm --version

# Check PostgreSQL
psql --version  # Should be 16+
```

## Step 1: Database Setup

### Option A: Using PostgreSQL Command Line (Recommended)

```powershell
# Connect to PostgreSQL as postgres user
psql -U postgres

# In psql console, run these commands:
CREATE DATABASE learnai;
CREATE USER crisis WITH PASSWORD 'crisis123';
ALTER USER crisis CREATEDB;
GRANT ALL PRIVILEGES ON DATABASE learnai TO crisis;
\q

# Verify connection
psql -U crisis -d learnai -h localhost -p 5433
```

**Note:** If PostgreSQL is not in your PATH, navigate to the PostgreSQL bin folder:
```powershell
cd "C:\Program Files\PostgreSQL\16\bin"
```

### Option B: Using pgAdmin GUI

1. Open pgAdmin
2. Right-click "Databases" → Create → Database
3. Name: `learnai`
4. Create a user `crisis` with password `crisis123`
5. Grant all privileges to the `learnai` database

## Step 2: Install Dependencies

```powershell
# From the Skill-Navigator root directory
npm install

# Install client dependencies
cd client
npm install
cd ..
```

## Step 3: Database Migrations

```powershell
npm run db:push
```

This will:
- Connect to your PostgreSQL database
- Create all required tables
- Set up the database schema

## Step 4: Start Development Server

```powershell
npm run dev
```

This starts:
- **Backend server**: http://localhost:5000
- **Frontend**: http://localhost:5173 (via Vite)

## ✅ Verification

Once running, test:
1. Navigate to http://localhost:5000
2. Check console for any errors
3. Test authentication features
4. Verify database connection by viewing dashboard data

## Troubleshooting

### PostgreSQL Connection Failed
- Verify DB_PORT is 5433 in `.env` (check your PostgreSQL installation port)
- Verify `crisis` user and password in `.env`
- Test: `psql -U crisis -d learnai -h localhost -p 5433`

### "Module not found" errors
```powershell
# Clear and reinstall
rm -r node_modules package-lock.json
npm install
cd client && npm install && cd ..
```

### Port 5000 already in use
- Change PORT in `.env` to another value (e.g., 5001)
- Or kill the process using port 5000

### Database migration fails
```powershell
# Check Drizzle config
cat drizzle.config.ts

# View database connection
psql -U crisis -d learnai -h localhost -p 5433 -c "\dt"
```

## Environment Variables

Current configuration in `.env`:
- **Database**: PostgreSQL at localhost:5433
- **User**: crisis / crisis123
- **Database Name**: learnai
- **Server Port**: 5000
- **API Key**: Gemini API already configured
- **JWT Secret**: Set for authentication

To change these, edit the `.env` file directly.

## Next Steps

Once running:
1. Create an account at http://localhost:5000
2. Generate a skill roadmap
3. Explore the dashboard and analytics
4. Check browser console for any client-side errors
5. Check server logs in the terminal for backend logs

