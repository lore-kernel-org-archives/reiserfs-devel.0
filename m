From: Emil Larsson <d99-ela@nada.kth.se>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 00:17:48 +0200
Message-ID: <412E618C.2020708@nada.kth.se>
References: <Pine.LNX.4.44.0408261356330.27909-100000@chimarrao.boston.redhat.com>	 <200408262128.41326.vda@port.imtp.ilyichevsk.odessa.ua>	 <20040826193617.GA21248@arlut.utexas.edu>	 <20040826201639.GA5733@mail.shareable.org>	 <1093551956.13881.34.camel@leto.cs.pocnet.net>	 <16686.23053.559951.815883@thebsh.namesys.com> <1093556917.13881.78.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20825-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1093556917.13881.78.camel@leto.cs.pocnet.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christophe Saout <christophe@saout.de>
Cc: Nikita Danilov <nikita@clusterfs.com>, Jamie Lokier <jamie@shareable.org>, Jonathan Abbey <jonabbey@arlut.utexas.edu>, Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Rik van Riel <riel@redhat.com>, Linus Torvalds <torvalds@osdl.org>, Diego Calleja <diegocg@teleline.es>, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Christophe Saout wrote:

>Am Freitag, den 27.08.2004, 01:45 +0400 schrieb Nikita Danilov:
>
>  
>
>> > At least in reiser4 they don't have, or at least you can't access them.
>>
>>They do.
>>
>> > ln -s foo bar; cd bar/metas shows me the content of foo/metas.
>>
>>That's because lookup for "bar" performs symlink resolution.
>>    
>>
>
>So I can't access them and it is pointless. ;-)
>
>BTW, I can do a cd metas/metas/metas/metas/plugin/metas... I don't think
>this makes sense. :)
>
>  
>
I prefer this one:

hepburn:/# mount
/dev/sda3 on / type reiser4 (rw)
hepburn:/# touch apa
hepburn:/# chmod +x apa
hepburn:/# cd apa
hepburn:/apa# ls
ls: reading directory .: Not a directory

So there is already file-as-dir with legacy "ls" - and it works just 
like people seem to want it to do with legacy apps. Not at all.

/Emil

