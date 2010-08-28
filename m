From: <doiggl@velocitynet.com.au>
Subject: compination script for Reiser4 on 2.6.35 and  reiser4progs listing
Date: Sat, 28 Aug 2010 20:01:46 +1000
Message-ID: <204bc31a9ea0f13da8f7a87f97ef4eb5@mail.velocitynet.com.au>
References: <AANLkTikznBfLD366L00+bWu0JGfutxO8NyhDQR1n8Azy@mail.gmail.com> <32a245fad07f283f908213fcfc1e8fd9@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <32a245fad07f283f908213fcfc1e8fd9@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

1. Here is a script I put together to compile a reiser4 based kernel
# source adapted from 
http://linuxhelp.150m.com/installs/compile-kernel.htm

#set kernel versions
majorv="35"
minorv=".3"
version=$majorv$minorv

#copy and unpack files and set linkages 
cd /usr/src
rm -rf linux-2.6.$version linux
cp -v /media/disk/kernel/linux-2.6.$version.tar.bz2 .
rm  linux-2.6.$version.tar
bunzip2 -v linux-2.6.$version.tar.bz2
tar -xvf linux-2.6.$version.tar
ln -s linux-2.6.$version linux

# copy in prepared reiser 4 enabled .config, apply reiser4 patch and
compile reiser4 enabled kernel
cp -v /boot/config-$(uname -r) /usr/src/linux/.config
cd /usr/src/linux
rm applyreiser4patch.$version.log
patch -p1 < /media/disk/r4-info/patch/reiser4-for-2.6.$majorv.patch | tee
applyreiser4patch.$version.log
cp -v /media/disk/src/reiser4enabled.config.$majorv 
/usr/src/linux/.config
make rpm-pkg | tee reiser4enabledkernel-v$version.log

#copy reiser4 built kernel rpms for use
cat reiser4enabledkernel-v35.3.log  | grep -i "wrote:" | cut -d ":" -f2 |
sed "s/^/cp -iv /g" |sed "s/.rpm/.rpm \/./g"

2. Also here is a listing of reiser4progs I found 

http://download.opensuse.org/repositories/home:/lmich/openSUSE_11.1/i586/reiser4progs-1.0.7-1.1.i586.rpm

http://download.opensuse.org/repositories/home:/lmich/openSUSE_11.1/i586/reiser4progs-devel-1.0.7-1.1.i586.rpm

http://download.opensuse.org/repositories/home:/lmich/openSUSE_11.1/src/reiser4progs-1.0.7-1.1.src.rpm

http://download.opensuse.org/repositories/home:/lmich/openSUSE_11.1/x86_64/reiser4progs-1.0.7-1.1.x86_64.rpm

http://download.opensuse.org/repositories/home:/lmich/openSUSE_11.1/x86_64/reiser4progs-devel-1.0.7-1.1.x86_64.rpm

http://download.opensuse.org/repositories/home:/lmich/openSUSE_Factory/i586/reiser4progs-1.0.7-1.21.i586.rpm

http://download.opensuse.org/repositories/home:/lmich/openSUSE_Factory/i586/reiser4progs-devel-1.0.7-1.21.i586.rpm

http://download.opensuse.org/repositories/home:/lmich/openSUSE_Factory/src/reiser4progs-1.0.7-1.21.src.rpm

http://download.opensuse.org/repositories/home:/lmich/openSUSE_Factory/x86_64/reiser4progs-1.0.7-1.21.x86_64.rpm

http://download.opensuse.org/repositories/home:/lmich/openSUSE_Factory/x86_64/reiser4progs-devel-1.0.7-1.21.x86_64.rpm

http://download.opensuse.org/repositories/home:/lmich/SLE_10/i586/reiser4progs-1.0.7-1.1.i586.rpm

http://download.opensuse.org/repositories/home:/lmich/SLE_10/i586/reiser4progs-devel-1.0.7-1.1.i586.rpm

http://download.opensuse.org/repositories/home:/lmich/SLE_10/src/reiser4progs-1.0.7-1.1.src.rpm

http://download.opensuse.org/repositories/home:/lmich/SLE_10/x86_64/reiser4progs-1.0.7-1.1.x86_64.rpm

http://download.opensuse.org/repositories/home:/lmich/SLE_10/x86_64/reiser4progs-devel-1.0.7-1.1.x86_64.rpm



Glenn
