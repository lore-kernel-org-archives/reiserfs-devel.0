From: Matthew Garrett <mgarrett@chiark.greenend.org.uk>
Subject: Re: reiser4 non-free?
Date: Thu, 06 May 2004 19:42:27 +0100
Message-ID: <E1BLnpD-0004fR-00@chiark.greenend.org.uk>
References: <4097CCA4.4060707@namesys.com> <87fzag139k.fsf@aule.evenmere.org> <4099A868.9030406@slaphack.com> <20040506.083242.41632888.wlandry@ucsd.edu> <87k6zpy8ke.fsf@aule.evenmere.org> <20040506143643.GB25505@raptus.homelinux.org> <877jvpy08v.fsf@aule.evenmere.org> <877jvpy08v.fsf@aule.evenmere.org> <409A7F98.7040609@namesys.com>
Return-path: <reiserfs-list-return-18492-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <409A7F98.7040609@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiser@namesys.com
Cc: debian-legal@lists.debian.org, reiserfs-list@namesys.com

Hans Reiser wrote:
>The License: The Anti-plagiarism license is the Gnu Public License Version 2
>with the following modification: you may not modify, remove, or obscure any
>credits in the software unless your modification causes those credits to 
>remain
>equally prominent and to retain their wording. You are not required to 
>display
>the credits if the computer has no effective display mechanism, or if 
>you do not
>distribute the software to others.

Ok, that's a restriction that's not present in the GPL version 2
(otherwise it wouldn't be necessary). Section 6 of the GPL says:

  6. Each time you redistribute the Program (or any work based on the
Program), the recipient automatically receives a license from the
original licensor to copy, distribute or modify the Program subject to
these terms and conditions.  You may not impose any further
restrictions on the recipients' exercise of the rights granted herein.
You are not responsible for enforcing compliance by third parties to
this License.

Which means that code under the Anti-plagiarism license is not GPL
compatible, since it imposes further restrictions. This would prevent
anyone from distributing it with their kernel. In order for it to be
distributable at all, you'd also need to demonstrate that it isn't a
derivative work of the Linux kernel.
-- 
Matthew Garrett | mjg59-chiark.mail.debian.legal@srcf.ucam.org
