#!/usr/bin/env powershell
# Skill Navigator - Quick Setup Script
# This script helps set up the database and start the development server

Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "📱 Skill Navigator - Setup Script" -ForegroundColor Green
Write-Host "=====================================" | PrintingContext:nl

Write-Host "`n✅ Step 1: Dependencies Already Installed!" -ForegroundColor Green

Write-Host "`n📦 Step 2: Database Setup Required (Manual)" -ForegroundColor Yellow
Write-Host "─────────────────────────────────────────" -ForegroundColor Gray

Write-Host @"
The project is configured to use:
  • Database: PostgreSQL at localhost:5433
  • User: crisis
  • Password: crisis123
  • Database Name: learnai

⚠️  PostgreSQL must be running and accessible on port 5433

Run these commands in PowerShell (as Administrator):
"@

Write-Host "`nCommand 1: Create Database and User" -ForegroundColor Cyan
Write-Host @"
psql -U postgres -c "CREATE DATABASE learnai;"
psql -U postgres -c "CREATE USER crisis WITH PASSWORD 'crisis123';"
psql -U postgres -c "ALTER USER crisis CREATEDB;"
psql -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE learnai TO crisis;"
"@ -ForegroundColor DarkGray

Write-Host "`nCommand 2: Verify Connection" -ForegroundColor Cyan
Write-Host @"
psql -U crisis -d learnai -h localhost -p 5433 -c "SELECT 1;"
"@ -ForegroundColor DarkGray

Write-Host "`n📊 Step 3: Run Database Migrations" -ForegroundColor Yellow
Write-Host "─────────────────────────────────────────" -ForegroundColor Gray
Write-Host @"
After database is set up, run this command from the project root:

npm run db:push
"@ -ForegroundColor DarkGray

Write-Host "`n🚀 Step 4: Start Development Server" -ForegroundColor Yellow
Write-Host "─────────────────────────────────────────" -ForegroundColor Gray
Write-Host @"
npm run dev

This will start:
  • Backend: http://localhost:5000
  • Frontend: http://localhost:5173
"@ -ForegroundColor DarkGray

Write-Host "`n🧪 Verification Checklist" -ForegroundColor Yellow
Write-Host "─────────────────────────────────────────" -ForegroundColor Gray
Write-Host @"
☐ PostgreSQL is running
☐ Database 'learnai' is created
☐ User 'crisis' exists
☐ Backend accessible at http://localhost:5000
☐ No errors in the console
☐ Can access the application
"@ -ForegroundColor DarkGray

Write-Host "`n📝 For detailed setup instructions, see SETUP.md" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
