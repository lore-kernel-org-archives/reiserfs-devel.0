From: Ingo Bormuth <ibormuth@efil.de>
Subject: Specify tmgr.atom_max_age per directory ?
Date: Fri, 16 Dec 2005 15:05:22 +0100
Message-ID: <20051216140522.GA9781@kruemel>
Reply-To: Ingo Bormuth <ibormuth@efil.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27323-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: ingo@bormuth.org


Is it (or will it once) be possible to specify tmgr.atom_max_age on a per
directory basis. To do something link:

  /      : tmgr.atom_max_age=300
  /data  : tmgr.atom_max_age=30
  /var   : tmgr.atom_max_age=900
  /tmp   : tmgr.atom_max_age=INFINITE


-- 
Ingo Bormuth, voicebox & telefax: +49-12125-10226517       '(~o-o~)'
public key 86326EC9, http://ibormuth.efil.de/contact   --ooO--(.)--Ooo--

