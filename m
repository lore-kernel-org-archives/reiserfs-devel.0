From: David Masover <ninja@slaphack.com>
Subject: Re: File as a directory - Ordered Relations
Date: Fri, 27 May 2005 23:56:35 -0500
Message-ID: <4297FA03.6050603@slaphack.com>
References: <6708893568-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24182-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <6708893568-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: Leo Comerford <leocomerford@gmail.com>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans, comment please?  Is this approaching v5 / v6 / Future Vision?  It
does seem more than a little "clunky" when applied to v4...

Alexander G. M. Smith wrote:
> Leo Comerford wrote on Wed, 18 May 2005 12:50:38 +0100:
> 
>>But if you have relation-directories and the ability to find the
>>pathnames of a given file, you can do everything you can do with
>>subfiles, just as nicely, and more besides. And if subfiles are
>>completely redundant and bad news anyway, we shouldn't have them.
> 
> 
> I prefer subfiles (or fildirutes) as being easier to understand.  But
> maybe that's just due to lots of experience with using file hierarchies.
> I can see having a relational system, but I'd always want to also have
> a directory hierarchy namespace, so that all files can be named.
> 
> Having those relationship directories seems kind of clunky - since
> they're not located near the object being investigated.  Though
> that's a GUI matter of making the system file browser pop up a
> "Show Relationships..." menu item as contrasted with drilling down
> to a subfile directory listing by clicking on an item.
> 
> 
>>The idea is that if you want to assert a single-place predicate of a
>>file, like "file x is important", you just use give the file an
>>approprate full path"name" ('~/important' or whatever). If you want to
>>assert a multi-place predicate - a relation - like "file x is more
>>important than file y" then you use a relation-directory. That goes
>>for every kind of multi-way relation/association you might want to
>>assert between files - one to one, one to many, many to many.
> 
> 
> Good point about sorted relationships.  Reminds me a bit about
> attributes in BeOS and using them to sort file listings.  There may
> be a duality between relation directories and a file system with
> indexed attributes, like BeOS's BFS or a true file-is-a-directory
> system.
> 
> One system has a relations directory stuffed with property values of
> a similar kind (such as short text descriptions for photos).  The
> directory implies the contents type (short text description), while
> the items also link to the thing they are expressing a relationship
> about (the photos).
> 
> The other system treats the object (the photo file) both as readable
> data and as a directory with attribute-ish sub-things, like a sub-file
> containing the text description of the photo.  File types are done as
> meta-data (a couple of bytes attached to the object nodes), marking
> the photo as JPEG data and the description subfile as text.  For bonus
> points, the file type can also appear as a virtual child object to make
> accessing the file type the same as accessing other data (no new APIs
> needed).  Another advantage is that doing a directory listing of an
> object gives you all its relations too (multiple parent objects listed).
> 
> 
> Ordered Relations?
> 
> Now how to do an ordered relation?  For example, say you have the
> shooting date for each photo as a property and you want to find
> all photos shot on a given day, or range of days.  Either system
> can be used to find them.
> 
> With relations, look in the relation directory that stores shooting
> dates and sort by name (assuming that the naming of the items reflects
> the date).  Say, just how do you name the relation items?  You had
> aardvark and other animal names in your examples.  Should the actual
> value be used (like the whole photo description text) as a name?
> Or is the directory magically sorted by property value somehow?
> Or is the relation directory just a concept, not actually browsable?
> 
> In the file/directory/attribute system, one of the file types would
> be "shooting date" and all files with that type would be automatically
> indexed, if you had created an index for "shooting date" earlier.  The
> index merely stores the relevant value (a date) and a link (inode number?)
> to the file.  To find the actual photo with a given date you'd have to
> find the parent of the attribute-ish subfile thing the index gives you.
> 
> Come to think of it, if you display the index as a directory, you
> kind of have your relation directory.  I had that as a feature in
> AGMSRAMFileSystem, using the attribute values as the name of a
> symbolic link pointing to the related item.  But it didn't occur to
> me that it was like your relation directories until now.  Here's an
> example - the last modified index for all files.  The date is in
> microseconds for better sorting, and lack of time zone printing
> functions in the BeOS kernel:
> 
> Fri May 27 20:12:36 24 /RAMDisk/.Indices>ls -l last_modified
> total 1497
> lrwxrwxrwx   0 agmsmith agmsmith        2 Sep 10  2001 1000158923000000 #604f52f8 -> /RAMDisk/PineappleData/news/Servers/NLZ/music.in_fidelity
> lrwxrwxrwx   0 agmsmith agmsmith        2 Sep 10  2001 1000159028000000 #6094a790 -> /RAMDisk/PineappleData/saved/Keepsakes/PM999697.pmf
> lrwxrwxrwx   0 agmsmith agmsmith        2 Sep 10  2001 1000172295000000 #608fb640 -> /RAMDisk/PineappleData/saved/Keepsakes/PM999685.pmf
> lrwxrwxrwx   0 agmsmith agmsmith        2 Sep 18  2001 1000849618000000 #60bd8278 -> /RAMDisk/mozilla/res/samples/toolbarTest1.xul
> lrwxrwxrwx   0 agmsmith agmsmith        2 Sep 18  2001 1000849618000000 #60edc108 -> /RAMDisk/mozilla/res/samples/scrollbarTest1.xul
> lrwxrwxrwx   0 agmsmith agmsmith        2 Sep 18  2001 1000849627000000 #608eb2e0 -> /RAMDisk/mozilla/res/samples/tab.xul
> ...
> 
> However, that brings up the extra power of queries.  In BeOS you can build
> a query string something like "ShootingDate=May 27 2005 & Location=*Home*"
> for all photos shot on May 27th at locations that contain the word "Home".
> It's a combination of relations.  Internally the simple query processor
> just finds the files matching one of the indices (Shooting Date would be
> the better choice since it is more constrained) then checks the resulting
> set of files against the rest of the query.
> 
> If it's a duality, I suspect you'd be able to do something similar with
> your relation directories.  For that matter, I was planning to add a
> feature for showing query results as a virtual directory, so that queries
> would be available to ordinary file namespace programs, like "ls".
> Unfortunately the real world intervened and I had to end my sabbatical.
> Lots of nifty topics still waiting there for someone to research and
> implement!
> 
> - Alex

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQpf6A3gHNmZLgCUhAQJy/g//Z5TKj/bSOL64yQr9clXQQ7DmNdxYF8Yp
CpKi5r7boPgLYnZX3jHIX+paF7rpACYDfHKzq4fPJn9ey1c5qPSYLZSAQSm8pFgj
XfEm/L74aHIxfFNWrDcD9VBdeKjZ7ZDjRLNt8m3F7v4QfT/umz5n42IJoueKHsNm
u4ZPNgFxt6LxaIXoaRejG6VLISSdlAU7IqiIXi/UxiFEzXhTYeshPt/NoErT1Kyk
zCBkTB9cV1KedevfBOgodsZ5uRHt4UHxVhEM8CG0ioaUlkOUFo4bNlvsCS/Pyrq7
k5RB9U1cOZmx2hPnNr06JSQT1IeuX4z/6CpCdEkA1OPPjaMC1ei1N+eMIm5HZ/xp
FNP2kw2/Dsv2zkbIW74lLubJrk1UaFnanZ2uAKFfISxMJyctG58+HOvbn80wp1Ma
JHphD3CbIRkRbll0zJPanNBbJl587GYchlTh4PETOF//WNnW373aoyVyYUQfHWlM
y+y9PKaXTS1y5Jcffgwb5kXAWqQFWDM1lXWtcVHJtflnmqfBWRYJADUd0Da8YkyB
t+76TwMTCdoTbOyqOlrqehi7ypuLrXXodxBehfYhawjh032yoOuMqUG7BDOACs7m
T7zrT/XXyCLJUb308fPqYaDuMg7LFNjdKy+aDcPj/dfbmdSk7fyViZePaLmNShqG
LS9t3pvE0l8=
=Rl0b
-----END PGP SIGNATURE-----
