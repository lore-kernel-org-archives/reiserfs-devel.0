From: doiggl@velocitynet.com.au
Subject: Re: Timing result of removal of 8012 files in 2 directories
Date: Sat, 26 Jul 2008 13:56:54 +1000 (EST)
Message-ID: <20694.202.168.22.19.1217044614.squirrel@webmail.velocity.net.au>
References: <11010.202.168.22.19.1216992345.squirrel@webmail.velocity.net.au>
    <5e2ec5ac0807251215h22742a3bv21472b6643a3e518@mail.gmail.com>
    <b15ad7640807252004l3c7b5c3ei8d2db7f1b8f35c87@mail.gmail.com>
    <b15ad7640807252006g67889f9am6197e4fab64a21a9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <b15ad7640807252006g67889f9am6197e4fab64a21a9@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Here are some basic specifications:
- Opteron 2350
- Operating system (Opensuse 11) 64 bit on one disk. Reiser4 formatted on
another data disk(SATA)
- Disk formatted in the following way:

# mkfs.reiser4 -o create=ccreg40,compress=lzo1 /dev/sda -fy
# fsck.reiser4 --fix /dev/sda -y
# mkdir /reiser4
# mount -t reiser4 /dev/sda /reiser4

For additional reading see the following:
https://bugzilla.novell.com/show_bug.cgi?id=412192
https://bugzilla.novell.com/show_bug.cgi?id=246576
https://bugzilla.novell.com/show_bug.cgi?id=366250
Glenn

