From: bscott@ntisys.com
Subject: RE: Write-once file system
Date: Fri, 27 Jun 2003 14:41:43 -0400 (EDT)
Sender: bscott@ntisys.com
Message-ID: <Pine.LNX.4.44.0306271437540.18120-100000@dragon.inside.ntisys.com>
References: <Pine.LNX.4.44.0306271700140.3922-100000@potato.zayda.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14756-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.44.0306271700140.3922-100000@potato.zayda.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Mailing List <reiserfs-list@namesys.com>

On Fri, 27 Jun 2003, at 5:09pm, jason@lunkwill.org wrote:
> So what you're asking for is something beyond root's control that can tell
> him "no" when he asks to write to an immutable file.

  That is acknowledged.  However, the EXT2/3 filesystem drivers still
prevent *any* process from writing to an immutable file, privileged or
otherwise.  Of course, root can simply remove the immutable bit, but the
idea is that it has to be a *deliberate* action.

  Protecting against mistakes done by an operator running as "root" is also
valid, even if one cannot protect against an attacker running as "root".

  Thus, I submit that a "write once" or "append only" mechanism should be
honored by the filesystem driver, even if the process has root privileges.

-- 
Ben Scott <bscott@ntisys.com>
| The opinions expressed in this message are those of the author and do  |
| not represent the views or policy of any other person or organization. |
| All information is provided without warranty of any kind.              |

