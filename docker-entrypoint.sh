#!/usr/bin/env bash

QQGUILD_PLUGIN_PATH="/app/Yunzai-Bot/plugins/QQGuild-Plugin"
TELEGRAM_PLUGIN_PATH="/app/Yunzai-Bot/plugins/Telegram-Plugin"
KOOK_PLUGIN_PATH="/app/Yunzai-Bot/plugins/KOOK-Plugin"
DISCORD_PLUGIN_PATH="/app/Yunzai-Bot/plugins/Discord-Plugin"
ICQQ_PLUGIN_PATH="/app/Yunzai-Bot/plugins/ICQQ-Plugin"

MIAO_PLUGIN_PATH="/app/Yunzai-Bot/plugins/miao-plugin"
GENSHIN_PATH="/app/Yunzai-Bot/plugins/genshin"
XIAOYAO_CVS_PATH="/app/Yunzai-Bot/plugins/xiaoyao-cvs-plugin"
GUOBA_PLUGIN_PATH="/app/Yunzai-Bot/plugins/Guoba-Plugin"

ACHIEVEMENTS_PLUGIN_PATH="/app/Yunzai-Bot/plugins/achievements-plugin"
EXPAND_PLUGIN_PATH="/app/Yunzai-Bot/plugins/expand-plugin"
FLOWER_PLUGIN_PATH="/app/Yunzai-Bot/plugins/flower-plugin"
STARRAIL_PLUGIN_PATH="/app/Yunzai-Bot/plugins/StarRail-plugin"
PY_PLUGIN_PATH="/app/Miao-Yunzai/plugins/py-plugin"

if [[ ! -d "$HOME/.ovo" ]]; then
    mkdir ~/.ovo
fi

cd /app/Yunzai-Bot
if [[ -n $(git status -s) ]]; then
    echo -e "\n当前工作区有修改，尝试暂存后更新。"
    git add .
    git stash
    git pull origin main --allow-unrelated-histories --rebase
    git stash pop
else
    git pull origin master --allow-unrelated-histories
fi
pnpm install -P --registry=https://registry.npmmirror.com

if [ ! -d $GENSHIN_PATH"/.git" ]; then
    echo -e "\n ${Warn} ${YellowBG} 检测到Yunzai-genshin目前没有安装，开始自动下载 ${Font} \n"
    git clone --depth=1 https://gitee.com/TimeRainStarSky/Yunzai-genshin.git ./plugins/genshin/
fi

cd $GENSHIN_PATH
if [[ -n $(git status -s) ]]; then
    echo -e "\n当前工作区有修改，尝试暂存后更新。"
    git add .
    git stash
    git pull origin main --allow-unrelated-histories --rebase
    git stash pop
else
    git pull origin master --allow-unrelated-histories
fi

if [ ! -d $MIAO_PLUGIN_PATH"/.git" ]; then
    echo -e "\n ${Warn} ${YellowBG} 由于喵版云崽依赖miao-plugin，检测到目前没有安装，开始自动下载 ${Font} \n"
    git clone --depth=1 https://gitee.com/yoimiya-kokomi/miao-plugin.git ./plugins/miao-plugin/
fi

cd $MIAO_PLUGIN_PATH
if [[ -n $(git status -s) ]]; then
    echo -e "\n当前工作区有修改，尝试暂存后更新。"
    git add .
    git stash
    git pull origin master --allow-unrelated-histories --rebase
    git stash pop
else
    git pull origin master --allow-unrelated-histories
fi
pnpm install -P --registry=https://registry.npmmirror.com

if [ -d $ICQQ_PLUGIN_PATH"/.git" ]; then
    cd $ICQQ_PLUGIN_PATH
    if [[ -n $(git status -s) ]]; then
        echo -e "\n当前工作区有修改，尝试暂存后更新。"
        git add .
        git stash
        git pull origin main --allow-unrelated-histories --rebase
        git stash pop
    else
        git pull origin main --allow-unrelated-histories
    fi
fi

if [ -d $QQGUILD_PLUGIN_PATH"/.git" ]; then
    cd $QQGUILD_PLUGIN_PATH
    if [[ -n $(git status -s) ]]; then
        echo -e "\n当前工作区有修改，尝试暂存后更新。"
        git add .
        git stash
        git pull origin main --allow-unrelated-histories --rebase
        git stash pop
    else
        git pull origin main --allow-unrelated-histories
    fi
fi

if [ -d $TELEGRAM_PLUGIN_PATH"/.git" ]; then
    cd $TELEGRAM_PLUGIN_PATH
    if [[ -n $(git status -s) ]]; then
        echo -e "\n当前工作区有修改，尝试暂存后更新。"
        git add .
        git stash
        git pull origin main --allow-unrelated-histories --rebase
        git stash pop
    else
        git pull origin main --allow-unrelated-histories
    fi
fi

if [ -d $KOOK_PLUGIN_PATH"/.git" ]; then
    cd $KOOK_PLUGIN_PATH
    if [[ -n $(git status -s) ]]; then
        echo -e "\n当前工作区有修改，尝试暂存后更新。"
        git add .
        git stash
        git pull origin main --allow-unrelated-histories --rebase
        git stash pop
    else
        git pull origin main --allow-unrelated-histories
    fi
fi

if [ -d $DISCORD_PLUGIN_PATH"/.git" ]; then
    cd $DISCORD_PLUGIN_PATH
    if [[ -n $(git status -s) ]]; then
        echo -e "\n当前工作区有修改，尝试暂存后更新。"
        git add .
        git stash
        git pull origin main --allow-unrelated-histories --rebase
        git stash pop
    else
        git pull origin main --allow-unrelated-histories
    fi
fi

if [ -d $ICQQ_PLUGIN_PATH"/.git" ] || [ -d $QQGUILD_PLUGIN_PATH"/.git" ] || [ -d $TELEGRAM_PLUGIN_PATH"/.git" ] || [ -d $KOOK_PLUGIN_PATH"/.git" ] || [ -d $DISCORD_PLUGIN_PATH"/.git" ]; then
    cd /app/Yunzai-Bot
    pnpm i
fi

if [ -d $GUOBA_PLUGIN_PATH"/.git" ]; then
    cd $GUOBA_PLUGIN_PATH
    if [[ -n $(git status -s) ]]; then
        echo -e "\n当前工作区有修改，尝试暂存后更新。"
        git add .
        git stash
        git pull origin master --allow-unrelated-histories --rebase
        git stash pop
    else
        git pull origin master --allow-unrelated-histories
    fi
    cd /app/Yunzai-Bot
    pnpm install --filter=guoba-plugin
fi

if [ -d $PY_PLUGIN_PATH"/.git" ]; then

    echo -e "\n ================ \n ${Info} ${GreenBG} 拉取 py-plugin 插件更新 ${Font} \n ================ \n"

    cd $PY_PLUGIN_PATH

    if [[ -n $(git status -s) ]]; then
        echo -e " ${Warn} ${YellowBG} 当前工作区有修改，尝试暂存后更新。${Font}"
        git add .
        git stash
        git pull origin v3 --allow-unrelated-histories --rebase
        git stash pop
    else
        git pull origin v3 --allow-unrelated-histories
    fi

    if [[ ! -f "$HOME/.ovo/py.ok" ]]; then
        echo -e "\n ================ \n ${Info} ${GreenBG} 更新 py-plugin 运行依赖 ${Font} \n ================ \n"
    fi
    pnpm install --filter=py-plugin
    if [[ ! -f "$HOME/.ovo/py.ok" ]]; then
        poetry config virtualenvs.in-project true
        poetry install
        touch ~/.ovo/py.ok
    fi
    
    echo -e "\n ================ \n ${Version} ${BlueBG} py-plugin 插件版本信息 ${Font} \n ================ \n"

    git log -1 --pretty=format:"%h - %an, %ar (%cd) : %s"

fi

if [ -d $XIAOYAO_CVS_PATH"/.git" ]; then
    cd $XIAOYAO_CVS_PATH
    if [[ -n $(git status -s) ]]; then
        echo -e "\n当前工作区有修改，尝试暂存后更新。"
        git add .
        git stash
        git pull origin master --allow-unrelated-histories --rebase
        git stash pop
    else
        git pull origin master --allow-unrelated-histories
    fi
    cd /app/Yunzai-Bot
    pnpm add promise-retry superagent -w
fi

if [ -f "./config/config/redis.yaml" ]; then
    sed -i 's/127.0.0.1/redis/g' ./config/config/redis.yaml
    echo -e "\n  修改Redis地址完成  \n"
fi

if [ -d $ACHIEVEMENTS_PLUGIN_PATH"/.git" ]; then
    cd $ACHIEVEMENTS_PLUGIN_PATH
    git pull
fi

if [ -d $EXPAND_PLUGIN_PATH"/.git" ]; then
    cd $EXPAND_PLUGIN_PATH
    git pull
fi

if [ -d $FLOWER_PLUGIN_PATH"/.git" ]; then
    cd $FLOWER_PLUGIN_PATH
    git pull
fi

if [ -d $STARRAIL_PLUGIN_PATH"/.git" ]; then
    cd $STARRAIL_PLUGIN_PATH
    git pull
fi

cd /app/Yunzai-Bot
node app
EXIT_CODE=$?

if [[ $EXIT_CODE != 0 ]]; then
    echo -e "\n ================ \n ${Warn} ${YellowBG} 启动 Yunzai 失败 ${Font} \n ================ \n"
    tail -f /dev/null
fi
