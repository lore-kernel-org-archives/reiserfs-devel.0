From: Tomas Carnecky <tom@dbservice.com>
Subject: Re: file as a directory
Date: Mon, 22 Nov 2004 18:15:22 +0100
Message-ID: <41A21EAA.2090603@dbservice.com>
References: <2c59f00304112205546349e88e@mail.gmail.com> <41A1FFFC.70507@hist.no>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22499-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41A1FFFC.70507@hist.no>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Helge Hafting <helge.hafting@hist.no>
Cc: Amit Gud <amitgud1@gmail.com>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Helge Hafting wrote:
> I recommend looking at archived threads about file as directory,
> you'll find many more arguments.  Currently there is one kind
> of support for archive files - loop mounts over files containing
> filesystem images.  These are not compressed though.

Isn't reiserfs trying to implement such things? I've read that in some 
next version of reiserfs one will be able to open /etc/passwd/[username] 
  and get the informations about [username], like UID, GID, home 
directory etc.

Still true? And when can we except such a version of reiserfs?

tom
