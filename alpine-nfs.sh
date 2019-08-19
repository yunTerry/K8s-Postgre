
# 安装NFS工具包，里面包含nfs服务端和客户端
apk add nfs-utils

# 配置nfs
mkdir -p /var/lib/nfs/rpc_pipefs /var/lib/nfs/v4recovery
echo "rpc_pipefs  /var/lib/nfs/rpc_pipefs  rpc_pipefs  defaults  0  0" >> /etc/fstab
echo "nfsd        /proc/fs/nfsd            nfsd        defaults  0  0" >> /etc/fstab


# 创建服务端目录
mkdir -p /nfs/postgre
# 增加读写权限
chmod a+rw -R /nfs/postgre
# 配置 NFS 服务
echo '/nfs/postgre *(rw,sync,no_root_squash)' >> /etc/exports

# 启动NFS
service nfs start
# 开机自启
rc-update add nfs default
