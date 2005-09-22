From: Fred Schaettgen <namesys.Sch@ttgen.net>
Subject: Re: Will I need to re-format my partition for using the compression plugin?
Date: Thu, 22 Sep 2005 23:38:19 +0200
Message-ID: <200509222338.20049.namesys.Sch@ttgen.net>
References: <194f625505092006316ad200b5@mail.gmail.com> <200509221951.38302.namesys.Sch@ttgen.net> <43330E14.9050209@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26249-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43330E14.9050209@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thursday, 22. September 2005 22:03, Edward Shishkin wrote:
> Fred Schaettgen wrote:
> >I don't quite understand how the file plugin concept scales once we get
> > more of them. For instance if I want to have an additional attribute
> > attached to my files, which contains a checksum that is kept up to date
> > whenever the file is changed. I'd have to use a special file plugin for
> > those files then, is this correct?
>
> Yes. It is impossible to implement all features in one file plugin.
> Checksuming means a low performance: 

It was just meant as an example for another possible feature of a file plugin, 
so let's forget about if it's slow or not for the moment or if it even makes 
no sense at all.
Replace it by any other file plugin you can imagine. Like a virus-scanning 
file plugin, a change log plugin, a versioned-file plugin, whatever.

The question was more about combining new features for single files in 
general. At some point I might want to have a file which is both compressed 
and which supports feature X at the same time.

But I can't do that (at least I think so). I can either patch the 
cryptcompress plugin, which is certainly not the right way(tm).
Or I can make up another file plugin, but then it can't be compressed at the 
same time. If we have as few as five different file plugins, such a 
limitation might hurt already.

There seems to be no way to create sort of a pipeline of plugins, it uses 
either one file plugin or another one.

...
> To write this new file plugin you will want to use already existing
> cipher and compression
> transform plugins (dont mix it with cryptcompress file plugin which also
> calls those plugins)
> to compress and encrypt your checksumed file.
...
> >Apparently the encryption and the compression is realized with one single
> > file plugin, so it seems that there is indeed no way to have both
> > features implemented as separate plugins.
>
> Why do you need separate ones? Having only a cryptcompress file plugin
> you will be able
> to create files which are either only encrypted or only compressed, just
> set the transform
> plugins properly.

I haven't heard about transform plugins at all so far. Are they meant to be 
used by the cryptcompress plugin only or is this a broader concept that can 
they be used by regular files too?

Sounds like it's a cryptcompress special, but "transform plugin" sounds like 
what I'm missing. It would be very heplful if I could attach any number of 
transform plugins to any single file.
Like that: VFS -> virus scanner -> change monitor -> versioning -> compression 
-> encryption -> checksum -> DISK

Let's hope that no one takes the the virus scanner part literally, it has the 
potential of feeding the reiser-eating trolls.
It's not about being able to create endless transformation pipelines and 
hundreds of plugins, but just the mere possibility to create an short 
arbitrary pipeline whenever it makes sense.

> > Or is there another reason why you packed
> >both things into one plugin?
>
> Because sometimes it is useful to compress data before encryption since
> compression
> destroys vulnerable regular structure of some special files (like *.html)
>
> >If most new file features have to be implemented
> >as part of one single plugin,
>
> Then this plugin will look like a monster ;)
> Not necessarily. On the oher hand, creating a separate file plugin for
> each feature
> imho is not a good idea.

Right, it isn't, because it's not possible to combine them. 
But if I do want to combine them, then what?

Hm, on second thought... forget about it for the moment. I shouldn't waste 
your time while reiser4 is trying so hard to find it's way into the mainline 
kernel. Let's hope that this fight will be over soon.

Fred
