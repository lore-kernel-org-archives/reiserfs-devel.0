From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: ReiserFS V4 kernel 2.6.9-rc1 mm4
Date: Tue, 14 Sep 2004 19:59:57 +0400
Message-ID: <1095177597.5478.172.camel@tribesman.namesys.com>
References: <1095149098.13920.ezmlm@namesys.com>
	 <42492.80.156.40.148.1095149724.squirrel@webmail.d-g-c.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21743-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42492.80.156.40.148.1095149724.squirrel@webmail.d-g-c.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mailinglists@d-g-c.de
Cc: reiserfs-list@namesys.com

Hello

On Tue, 2004-09-14 at 12:15, mailinglists@d-g-c.de wrote:
> Hi,
> i have got a big problem with my 220GB reiser4 partition. it is mounted to
> /home. i want to share it with nfs-server v3. it is mountable by a foreign
> client - but i get input/output errors when i try to swith into a
> subdirectory or a "ls -la". a simple "ls" does work without errors! are
> there any known nfs/reiser4 problems?
> 
Please describe configurations of both server and client: hardware and
software.
Does ls -la work on local filesystem?
What does dmesg say when ls -la reports i/o error?


> thx and greetz
>  florian engelmann
> 
> 

