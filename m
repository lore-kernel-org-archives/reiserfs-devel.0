From: Hans Reiser <reiser@namesys.com>
Subject: Re: file as a directory
Date: Mon, 22 Nov 2004 10:48:54 -0800
Message-ID: <41A23496.505@namesys.com>
References: <2c59f00304112205546349e88e@mail.gmail.com> <41A1FFFC.70507@hist.no> <41A21EAA.2090603@dbservice.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22508-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41A21EAA.2090603@dbservice.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tomas Carnecky <tom@dbservice.com>
Cc: Helge Hafting <helge.hafting@hist.no>, Amit Gud <amitgud1@gmail.com>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Tomas Carnecky wrote:

> Helge Hafting wrote:
>
>> I recommend looking at archived threads about file as directory,
>> you'll find many more arguments.  Currently there is one kind
>> of support for archive files - loop mounts over files containing
>> filesystem images.  These are not compressed though.
>
>
> Isn't reiserfs trying to implement such things? I've read that in some 
> next version of reiserfs one will be able to open 
> /etc/passwd/[username]  and get the informations about [username], 
> like UID, GID, home directory etc.


>
> Still true? And when can we except such a version of reiserfs?
>
> tom
>
>
It was more that we said we would like to implement the functionality 
necessary for doing that (e.g. inheritance), not that we would 
specifically do /etc/passwd.  And that functionality will trickle in 
over time.

Hans
