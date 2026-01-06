# 1. Check if files exist
if [ -f "index.html" ] && [ -f "script.js" ]; then
  echo "✅ Files Found"
else
  echo "❌ Missing index.html or script.js in root"
  exit 1
fi

# 2. Check for .gitignore
if [ -f ".gitignore" ]; then
  echo "✅ .gitignore Found"
else
  echo "❌ Missing .gitignore file in root"
  exit 1
fi

# 3. Check Commit Count (Must be > 1)
commit_count=$(git rev-list --count HEAD)
if [ "$commit_count" -gt 1 ]; then
  echo "✅ Commit History Good ($commit_count commits)"
else
  echo "❌ Too few commits ($commit_count). Did you upload everything at once?"
  exit 1
fi