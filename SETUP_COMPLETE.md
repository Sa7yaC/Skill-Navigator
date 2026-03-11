# 🎯 Skill Navigator - Complete Local Setup

✅ **Dependencies Installation: COMPLETE**
- Root dependencies: 594 packages installed
- Client dependencies: 115 packages installed

---

## 📋 Next Steps to Get Running

### Step 1️⃣: Ensure PostgreSQL is Running
- Verify PostgreSQL 16+ is installed
- Ensure it's running (check Windows Services or start via command line)
- Default PostgreSQL port: **5432**
- Project expects: **5433** (as configured in .env)

### Step 2️⃣: Create Database & User

Run these commands in **PowerShell as Administrator**:

```powershell
# Create the database
psql -U postgres -c "CREATE DATABASE learnai;"

# Create user
psql -U postgres -c "CREATE USER crisis WITH PASSWORD 'crisis123';"

# Give user database creation privileges
psql -U postgres -c "ALTER USER crisis CREATEDB;"

# Grant all privileges
psql -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE learnai TO crisis;"
```

**Alternative: Using Interactive psql**
```powershell
psql -U postgres

# Then in psql console:
CREATE DATABASE learnai;
CREATE USER crisis WITH PASSWORD 'crisis123';
ALTER USER crisis CREATEDB;
GRANT ALL PRIVILEGES ON DATABASE learnai TO crisis;
\q
```

### Step 3️⃣: Verify Database Connection
```powershell
psql -U crisis -d learnai -h localhost -p 5433 -c "SELECT 1;"
```
You should see: `?column?`
                `--------`
                `       1`

### Step 4️⃣: Run Database Migrations

From the project root:
```powershell
npm run db:push
```

This creates all required tables and schema.

### Step 5️⃣: Start Development Server

```powershell
npm run dev
```

Your application will be available at:
- **Frontend**: http://localhost:5173 (Vite dev server)
- **Backend**: http://localhost:5000 (Express server)

---

## 🌍 Environment Configuration

File: `.env` (Already configured)

```env
# Database
DB_USER=crisis
DB_PASSWORD=crisis123
DB_NAME=learnai
DB_PORT=5433
DATABASE_URL=postgresql://crisis:crisis123@localhost:5433/learnai

# Server
NODE_ENV=development
PORT=5000

# API Keys
GEMINI_API_KEY=AIzaSyAD-MbiSnWEV3z3zIf9EOnhnZg0C_TT0cg
JWT_SECRET=vP8VrZrek48mpI25uUBZeLb9GK8gsA4eHwqRYlAYPQI
```

---

## ⚠️ Troubleshooting

### Issue: "connect ECONNREFUSED 127.0.0.1:5433"
**Solution**: PostgreSQL is not running or port is incorrect
```powershell
# Check PostgreSQL process
Get-Process postgres

# Or start PostgreSQL service
net start "PostgreSQL (your version)"
```

### Issue: "FATAL: Ident authentication failed for user \"crisis\""
**Solution**: Verify user exists and password is correct
```powershell
psql -U postgres -c "\du"  # List all users
```

### Issue: "Database already exists"
**Solution**: Drop and recreate
```powershell
psql -U postgres -c "DROP DATABASE learnai;"
# Then recreate using Step 2 commands above
```

### Issue: npm run dev fails
**Solution**: Ensure all dependencies are installed
```powershell
# Clear everything
rm node_modules -r
rm client/node_modules -r
rm package-lock.json
rm client/package-lock.json

# Reinstall
npm install
cd client && npm install && cd ..
```

---

## 📝 Project Structure

```
Skill-Navigator/
├── client/              # React frontend (Vite)
│   ├── src/
│   │   ├── components/  # React components
│   │   ├── pages/       # Page components
│   │   ├── hooks/       # Custom hooks
│   │   └── index.css    # Styling
│   └── package.json
├── server/              # Node.js backend (Express)
│   ├── index.ts         # Main server file
│   ├── routes.ts        # API routes
│   └── db.ts            # Database setup
├── shared/              # Shared types & schemas
├── migrations/          # Database migrations
├── .env                 # Environment variables
├── package.json         # Root dependencies
├── tsconfig.json        # TypeScript config
├── vite.config.ts       # Vite configuration
└── drizzle.config.ts    # Drizzle ORM config
```

---

## 🎯 Common Development Commands

```powershell
# Start development server
npm run dev

# Build for production
npm run build

# Type check
npm run check

# Database operations
npm run db:push         # Push migrations
npm run db:generate     # Generate migrations

# Client only (from client/ directory)
cd client
npm run dev             # Vite dev server
npm run build           # Build client
npm run lint            # Run linter
```

---

## ✨ Features Overview

Once running, you can:
1. **Create Account** - Sign up with email/password
2. **Generate Roadmap** - Use AI to create learning paths
3. **Track Progress** - Monitor completion metrics
4. **View Analytics** - See learning insights
5. **Access Resources** - Curated video tutorials

---

## 🚀 You're Ready!

Once you complete all 5 steps above, the application will be fully functional on your localhost. 

If you encounter any issues:
1. Check the troubleshooting section above
2. Review error messages in the terminal
3. Verify all prerequisites are installed
4. Ensure database is accessible
5. Check network connectivity

Happy learning! 🎓

