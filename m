From: Manuel Krause <manuelkrause@netscape.net>
Subject: BTW: 2.4.19-patches-to-come?
Date: Tue, 07 May 2002 03:15:29 +0200
Message-ID: <3CD72AB1.6010607@netscape.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10270-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list <reiserfs-list@namesys.com>

Hi!

BTW, for 2.4.19-final it would be very nice to have...

1.) the deleted/truncated/completed-files-on-mount at least
     printed in the kernel logs, at best with the real filename
     -- as afterwards they are not retrievable --
     That's a security reason -- whoever can trigger a crash
     with various methods (I know the admin should take care
     against this case... but on my home sytem I'd like to know
     that info, too) but to get back the file from backups in
     case... who knows it before a
     crash... ? Am I missing something?

2.) a disk/drive/partition distinction in reiserfs related
     messages -- Oleg, you promised it to get real and best
     would be a real "patch" !

3.) a hint on how to turn on/off data-journaling for "some"
     of our existing reiserfs partitions if it exists at all
     for now and why it could be needed in some cases?!.

4.) a hint why there is iicache code in the latest
     speedup-compound-patch (so that the latest iicache patch
     would not apply)


Best regards for your stable ReiserFS, at all,

even under "settings" with 2.4.19-pre7 +reiserfs.pending +latest 
reiserfs.compound-speedup +aa.vm-for-2.4.19-pre7 +akpm.read-latency-2 
+rml.preempt-kernel + rml.lock-break +some-more nice aa.patches... 
That's a valuably fast & interactive experience!


Manuel


