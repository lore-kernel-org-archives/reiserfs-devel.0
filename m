From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 plugins
Date: Wed, 06 Jul 2005 08:26:12 -0500
Message-ID: <42CBDBF4.30801@slaphack.com>
References: <200507060251.j662p7OC005227@laptop11.inf.utfsm.cl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24991-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200507060251.j662p7OC005227@laptop11.inf.utfsm.cl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: Hubert Chan <hubert@uhoreg.ca>, Chet Hosey <chosey@nauticom.net>, Kevin Bowen <kevin@ucsd.edu>, Hans Reiser <reiser@namesys.com>, Kyle Moffett <mrmacman_g4@mac.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

Horst von Brand wrote:
> Hubert Chan <hubert@uhoreg.ca> wrote:
> 
>>On Fri, 01 Jul 2005 03:41:00 -0400, Chet Hosey <chosey@nauticom.net> said:
>>
>>>Horst von Brand wrote:
>>>
>>>>And who says that a normal user isn't allowed to annotate each and
>>>>every file with its purpose or something else?
> 
> 
>>Explain how you currently allow users to annotate arbitrary files.
> 
> 
> By keeping annotations /outside/ the files.
> 
> [...]
> 
> 
>>The situation is even better with file-as-dir.  If the administrator
>>wants to allow users to edit the description metadata for the file foo,
>>the administrator can set the appropriate permissions for
>>foo/.../description, and keep foo read-only.
> 
> 
> So now root is responsible in exquisite detail for random other users being
> able to keep info about my files?

If it's the general info that's associated with the file, and may even 
be stored inside the file, then yes, that's fair.

Although I could certainly imagine foo/.../descriptions being a 
directory that's world-writable, allowing each user to maintain their 
own file inside of it.  You can even set these per-user descriptions to 
be stored somewhere else, like the user's home directory, and that could 
work for CDs.

>>Actually, you could use something like unionfs to allow users to keep
>>their own annotations without affecting everyone else's.
> 
> 
> Again, root has to mount that stuff for each and every user?

Why is that a problem?  Put it in a script.  Mount each user's unionfs 
at boot.

And it's "something like unionfs" -- maybe it's a feature of metafs or 
reiserfs that we haven't thought of yet.  It certainly can't be unionfs 
as it stands, as unionfs doesn't work on top of any reiser.
