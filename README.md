# Raycaast AirPods Connector

<p align="center">
<img width="200" alt="Raycast Airpods Connector" src="icon.png"/>
</p>

This [Raycast](https://www.raycast.com/) script command helps you to quickly connect to your AirPods using a minmal wrapper around
the [BluetoothConnector](https://github.com/lapfelix/BluetoothConnector) utillity.

## ⚠️ Installation and Required Setup ⚠️

1. Install the [`BluetoothConnector`](https://github.com/lapfelix/BluetoothConnector) utility using [Homebrew](https://brew.sh):

   ```shell
   brew install bluetoothconnector
   ```

   Make sure to have [`brew`](https://brew.sh/) installed. This will install the latest version of `BluetoothConnector`.

2. Clone this repository.

   ```shell
   git clone https://github.com/mikeoertli/raycast-airpods-connector.git
   ```

   It is recommended to have `HOMEBREW_PREFIX` defined, for M1 Macs this will be `/opt/homebrew/`. It should be defined as:

   ```shell
   export HOMEBREW_PREFIX=$(brew --prefix)
   ```

3. Create a configuration file (`<raycast-airpods-connector clone dir>/airpods-mac.conf`) within the cloned directory (`git` ignores this file).
    * This config file should contain **only** the MAC address of your AirPods.
    * This config file is used to export an enviornment variable with the following, so ensure there is nothing else in it, including newlines or other content.
    * The MAC can use either no separator or a "`-`" separator, but `BluetoothConnector` does NOT work with a colon (`:`)-separated string. In other words, these are fine:

      ```shell
      >cat airpods-mac.conf
      aabbccddeeff

      >cat airpods-mac.conf
      aa-bb-cc-dd-ee-ff
      ```

4. Install into Raycast by adding this directory as a script directory in Raycast.

   ![Add script directory](https://github.com/raycast/script-commands/raw/master/images/screenshots/add-directory.png "Add script directory")

## Misc Notes

Unlike the my tweak to the original AirPods Connector for Alfred, this doesn't let you select your AirPods via the GUI, that may be something that gets added someday, but it isn't a high priority.

Make sure to install the latest version of `BluetoothConnector`:

```shell
brew update && brew upgrade bluetoothconnector
```

PRs welcome!

## Acknowledgments

This borrows from the [Afred variant](https://github.com/mikeoertli/alfred-airpods-connector), which in turn borrows from others.
