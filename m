From: Ingo Bormuth <ibormuth@efil.de>
Subject: guess_plugin_by_mode failure
Date: Thu, 15 Jun 2006 08:42:15 +0200
Message-ID: <20060615064215.GA5597@kruemel>
Reply-To: Ingo Bormuth <ibormuth@efil.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28784-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


I noticed some perl scripts refusing to work and found 
the files to be inaccessible:

  ls: Digest.pm: Input/output error
  ls: DirHandle.pm: Input/output error
  ls: Dumpvalue.pm: Input/output error

The logs show many nikita-737 warnings but nothing else:

  reiser4[find(4985)]: guess_plugin_by_mode (fs/reiser4/plugin/item/static_stat.c:676)[nikita-737]:
  WARNING: wrong file mode: 444

Removing the files is not possible but removing the 
parent directory just works.

Kernel: Vanilla 2.6.16.18 with reiser4-for-2.6.16-4.patch.gz
 

-- 
Ingo Bormuth, voicebox & telefax: +49-12125-10226517       '(~o-o~)'
public key 86326EC9, http://ibormuth.efil.de/contact   --ooO--(.)--Ooo--

