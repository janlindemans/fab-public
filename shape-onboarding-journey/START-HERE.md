# Get your one-click link (do this once)

**Open this folder in Finder:** [shape-onboarding-journey](file:///Users/janlindemans/Documents/Agent%20projects/RC%20experiments%20%7C%20Agent/Onboarding%20%7C%20Agent/Shape%20%7C%20Agent/Shape%20Launch/Jan%20manually%20selected/shape-onboarding-journey)  
*(Click the link; in Cursor/VS Code you may need Cmd+click. If it doesn’t open, use Finder → Go → Go to Folder and paste the path.)*

## What you need

- A **GitHub account** (free): [github.com](https://github.com) → Sign up if you don’t have one.
- **GitHub CLI** on this Mac. If you’re not sure, open Terminal and type:  
  `gh auth status`  
  If it says “logged in”, you’re good. If not, run:  
  `gh auth login`  
  and follow the prompts (browser login is easiest).

## What to do (one time)

1. **Open Terminal** (Spotlight: type “Terminal” and press Enter).

2. **Go into this folder.**  
   In Finder, open the **shape-onboarding-journey** folder. Drag that folder from Finder into the Terminal window and press Enter.  
   (Or copy-paste the path to that folder after `cd ` and press Enter.)

3. **Run the script.** Copy-paste this, then press Enter:
   ```bash
   chmod +x publish-to-github.sh && ./publish-to-github.sh
   ```

4. The script will:
   - Create a new public repo on your GitHub named **shape-onboarding-journey**
   - Upload this folder (index.html, thumbs, full)
   - Turn on GitHub Pages

5. At the end it will print your **live link**, like:
   `https://YOUR_USERNAME.github.io/shape-onboarding-journey/`  
   That’s the one-click link to share. It may take 1–2 minutes to work the first time.

---

**If something fails**

- “gh: command not found” → Install GitHub CLI: [cli.github.com](https://cli.github.com) or run `brew install gh`, then `gh auth login`.
- “Authentication required” → Run `gh auth login` and log in with your GitHub account.
- Repo already exists → The script will just push. If the repo name is taken, edit the first line of `publish-to-github.sh`: change `REPO_NAME="shape-onboarding-journey"` to something like `REPO_NAME="shape-onboarding-jan"` and run the script again.
