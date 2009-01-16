From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser4progs-1.0.7
Date: Sat, 17 Jan 2009 00:44:25 +0300
Message-ID: <4970FFB9.2060006@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Reiserfs mailing list <reiserfs-devel@vger.kernel.org>, Linux kernel mailing list <linux-kernel@vger.kernel.org>
Cc: =?ISO-8859-1?Q?Mathieu_B=E9langer?= <b747xx@gmail.com>

Hello everyone.

Changes since reiser4progs-1.0.6:

=2E Fixed bug in fsck reported by Mathieu B=E9langer
  (incorrect checking compressed file bodies);
=2E Alias -p "preen" to -a "auto" for fsck options;
=2E Suppressed per-object fsck reports about wrong bytes for
  files with data checksumming. Use fsck option --fix to
  set up their correct values (in the case of transparent
  compression i_blocks and i_bytes are not supported
  by kernel for performance reasons). If bytes are wrong
  because of fatal corruptions, then fsck will report about
  last ones.

All the patches were announced at reiserfs-devel mailing list.
Please, find at
http://www.kernel.org/pub/linux/utils/fs/reiser4/reiser4progs/

Thanks,
Edward.

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
