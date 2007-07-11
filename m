From: Ingo Bormuth <ibormuth@efil.de>
Subject: Nikita 19891
Date: Wed, 11 Jul 2007 06:46:17 +0200
Message-ID: <20070711044617.GA12129@efil.de>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org


Hmm, whenever I try to build busybox (1.4.2) I get nikita-191 panics:

[...]
cc	console_tools/clear.o
reiser4 panicked cowardly: reiser4[cc1(13066)]: save_file_hint (fs/reiser4/plugin/file.c:705) [nikity-1991]:
kernel panic - not syncing: reiser4[cc1(13066)]: save_file_hint (fs/reiser4/plugin/file.c:705) [nikity-1991]:

Running fsck.reiser4 before and after the panic doesn't show any complaints.
The partition is heavily used. I'm not aware of any other problem.

Vanilla-2.6.21.6 (kernel.org) with reiser4-2.6.21-path (namesys.com).

Not that I understood the code, but why is it an assertion at all?
Couldn't one just use an empty hint if the current one is invalid?

-- 
Ingo Bormuth, voicebox & fax: +49-(0)-12125-10226517
public key 86326EC9, http://ibormuth.efil.de/contact

