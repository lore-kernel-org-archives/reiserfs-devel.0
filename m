From: Francesco Biscani <frbiscani@jumpy.it>
Subject: reiser4 crash
Date: Sat, 24 Jul 2004 18:27:54 +0200
Message-ID: <200407241827.54674.frbiscani@jumpy.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19785-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I had reiser4 crash pretty badly. Here's the story.

My distribution is Gentoo. As you probably know it uses as packaging system a 
tool called "emerge" which basically installs applications following 
installation scripts called "ebuilds". Usually packages are compiled from 
sources, but not necessarily, since ebuilds can contain totally arbitrary 
instructions.

I decided to install the pre-compiled binary version of Openoffice 1.1.2, 
which under Gentoo is known as "openoffice-bin". The installation went on 
regularly, but near the end everything seemed to hang in the "Registering 
components" phase. No CPU or HD activity. After a while, suspecting a bug in 
the ebuild, I went over the Gentoo forums and I found these posts:

http://forums.gentoo.org/viewtopic.php?t=201410&highlight=openofficebin
http://forums.gentoo.org/viewtopic.php?t=184798&highlight=openofficebin+reiser4

These people also report problems installing openoffice on reiser4. In the 
meanwhile the installation process of openoffice-bin was still hanging, but 
suddenly the CPU went 100%. It was "system" activity, no "user" activity. Top 
revealed that it was the installation process that was eating all my CPU. The 
system was still working, but "sync" was not working (it hung). Pretty much 
worried, CPU still 100%, I tried to reboot, but the system was not able to do 
that. I tried to kill the offending process, with no luck. I had no choice 
but to push the power button.

fsck 0.5.6 revealed these errors:

FSCK: Directory [ccb2c:6d703300000000:10b195] (dir40), node [790184], item 
[0], unit [55]: entry has wrong offset
[10b195:0(NAME):14d69636861656c:2e4275626ce92e4d:14942a136fe7bf]. Should be
[10b195:0(NAME):14d69636861656c:2e4275626ce92e4d:14942a136f370f].
FSCK: Directory [209045:1536f6e6e792052:2e987a] (dir40), node [3593262], item 
[0], unit [5]: entry has wrong offset
[2e987a:0(NAME):1536f6e6e792052:6f6c6c696e73202d:2bd0cd03e55f727a]. Should be
[2e987a:0(NAME):1536f6e6e792052:6f6c6c696e73202d:2bd0cd03bde670ca].

I had to issue a --build-fs, which lead to:

FSCK: No 'lost+found' entry found. Building a new object with the key 
2a:0:ffff.
FSCK: Failed to recognize the plugin for the directory [2a:0:ffff].
FSCK: Trying to recover the directory [2a:0:ffff] with the default 
plugin--dir40.
FSCK: The file [2a:0:ffff] does not have a StatData item. Creating a new one. 
Plugin dir40.
FSCK: Directory [2a:0:ffff]: The entry "." is not found. Insert a new one. 
Plugin (dir40).
FSCK: Node (460152), item (2), [2a:0:ffff] (stat40): wrong size (0), Fixed to 
(1).
FSCK: Node (460152), item (2), [2a:0:ffff] (stat40): wrong bytes (0), Fixed to 
(50).
FSCK: Directory [ccb2c:6d703300000000:10b195] (dir40), node [790184], item 
[0], unit [55]: entry has wrong offset
[10b195:0(NAME):14d69636861656c:2e4275626ce92e4d:14942a136fe7bf]. Should be
[10b195:0(NAME):14d69636861656c:2e4275626ce92e4d:14942a136f370f]. Removed.
FSCK: Node (2917509), item (11), [ccb2c:6d703300000000:10b195] (stat40): wrong 
size (62), Fixed to (61).
FSCK: Node (2917509), item (11), [ccb2c:6d703300000000:10b195] (stat40): wrong 
bytes (4090), Fixed to (4012).
FSCK: Directory [209045:1536f6e6e792052:2e987a] (dir40), node [3593262], item 
[0], unit [5]: entry has wrong offset
[2e987a:0(NAME):1536f6e6e792052:6f6c6c696e73202d:2bd0cd03e55f727a]. Should be
[2e987a:0(NAME):1536f6e6e792052:6f6c6c696e73202d:2bd0cd03bde670ca]. Removed.
FSCK: Node (3688550), item (22), [209045:1536f6e6e792052:2e987a] (stat40): 
wrong size (13), Fixed to (12).
FSCK: Node (3688550), item (22), [209045:1536f6e6e792052:2e987a] (stat40): 
wrong bytes (1154), Fixed to (1052).

After that fs was consistent. In lost+found I found some files from the 
web-browser's cache and some temporary files from the installation of 
openoffice. So it probably stopped committing changes to the fs when the 
installation hung.

System logs did not record anything. Fortunately it seems like nothing is 
missing from my fs. Should I be worried about something? fsck does not find 
any errors.

Using auto-snapshot from 20 July agains 2.6.7-mm7.

Hope this is useful. I'll be glad to give more details is asked to. 
Regards,

  Francesco
