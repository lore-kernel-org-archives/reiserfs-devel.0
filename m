From: Fredrik Tolf <fredrik@dolda2000.com>
Subject: Re: XATTR bugs
Date: Wed, 10 Dec 2003 03:27:21 +0100
Message-ID: <16342.33929.573984.115066@pc7.dolda2000.com>
References: <16323.62343.428966.858580@pc7.dolda2000.com>
	<3FD65B57.8040603@suse.com>
	<16342.30028.148943.409122@pc7.dolda2000.com>
	<3FD680A6.9090403@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16313-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FD680A6.9090403@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Fredrik Tolf <fredrik@dolda2000.com>, reiserfs-list@namesys.com

Jeff Mahoney writes:
 > Fredrik Tolf wrote:
 > | These are not the greatest problems with the XATTR patches,
 > | though; they were only what I discovered initially. The greatest
 > | problem (I don't know if this might not appear on 2.4 kernels, but it
 > | certainly did occur on all my 2.6 kernels) is that ACLs can suddenly
 > | "disappear".
 > |
 > | I don't know exactly what it was that happened, but sometimes (without
 > | any pattern that I could notice), the ACLs would simply become
 > | ineffective. The XATTR for the ACLs was still there, but it was as if
 > | it wasn't taken into account for any kind of operation. When checking
 > | with getfattr, the ACL attribute was still there and looked just as it
 > | did before whatever happened happened, but in every other aspect it
 > | was as if it wasn't there anymore. The only way to solve it was to run
 > | "setfacl -b" on the affected file and then recreate the ACL.
 > |
 > | In fact, this forced me to abandon ReiserFS in favor of XFS.
 > | Regrettable as it may be, I didn't want to live without ACLs, and I
 > | had too much on my hands to start debugging it... :-(
 > 
 > This is the first I've heard of this behavior. Do you have a reliable
 > way of reproducing it? I realize that you said you didn't find a
 > pattern, but what was the workload you were applying to the ACLs?

Well, the machine I applied the patches to is the NFS server that I
use at home, so the workload isn't too great. It serves my and my
family's workstations, the web server (around 1000-2000 hits/day), and
some misc services. So as you can see, the load isn't too great, but
it's seldom completely idle.

The strange thing is that the behavior didn't seem very related to the
current workload, but rather localized to certain files/dirs. For
example, I use ACLs on all home directories to allow apache
through. Some home directories would never once lose the ACLs, while
others kept losing them all the time.

Unfortunately, I could never find a way to reproduce it manually. That
was the primary reason why I never started to debug it. At least I
know almost completely certain that it is specific to ReiserFS,
because since I switched to XFS, it hasn't happened once.

It would be really nice if you could find the bug. I still have some
time before the data grows so large that I don't have enough spare
hard drives to transfer the filesystem back to Reiser (and I really
would prefer using ReiserFS).

I'll just clarify one detail. The attribute was still there, even
though it seemed unused. Ie., a sample affected line of output from an
xattr-patched ls could look like this:

drwx------+  17 barbara  users        4096 Dec  4 21:07 barbara

As you can see, it acknowledges the existence of the attribute, but
even the mode is wrong. 700 is the mode that actually is set on the
file, but since the ACL is there (the ACL is to let apache through,
ie. u:apache:x), the reported mode should be 710. getfattr also
reports a correct ACL (ie. it hasn't been modified or corrupted or
anything).

Fredrik Tolf

