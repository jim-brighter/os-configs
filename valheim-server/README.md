## Valheim Server

1. Follow instructions on https://linuxgsm.com/servers/vhserver/ to create the server
1. Add the `gamedig` dependency: https://docs.linuxgsm.com/requirements/gamedig
1. Modify `lgsm/config-lgsm/vhserver/vhserver.cfg` to use gamedig for more detail:
    ```bash
    querymode="2"
    querytype="protocol-valve"
    ```
    gamedig is buggy so beware
1. Modify `lgsm/config-lgsm/vhserver/common.cfg` to prune old backups:
    ```bash
    stats="on"
    maxbackups="7"
    ```
1. Follow instructions in [pihole readme](../pihole/README.md) for setting up unattended upgrades
1. Add steam id to `.config/unity3d/IronGate/Valheim/adminlist.txt` for admin rights
