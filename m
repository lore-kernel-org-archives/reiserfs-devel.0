From: "Fred -- Speed Up --" <speedup@free.fr>
Subject: Some questions about Reiser4
Date: Fri, 25 Apr 2003 22:40:00 +0200
Message-ID: <000c01c30b6a$d7f12590$0200a8c0@xpstation>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0009_01C30B7B.9B0EFEC0"
Return-path: <reiserfs-list-return-13816-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------=_NextPart_000_0009_01C30B7B.9B0EFEC0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi there ;)

I've read the full official documentation about Reiser4 on the Namesys =
website, but some question still remain unanswerd. I'd like you to help =
me solving them :

- Firstly the trees. I read that the it (the storage one, not the =
semantic side) grew on top, which makes the key grow in lenght. But what =
about fanout ? When a file has been deleted, can its former key be freed =
and reused so that the tree keeps balanced ? Does Reiser4 otpimize the =
tree by storing small files together in a part of the tree, or =
directories, or whatever organisation : when a file is being written, =
does Reiser4 give it the first key it finds, or does a segragation exist =
in order to improve performance ? For instance, small temp files are =
created and deleted numbers of times, does a special part of the tree =
keep those temp files so that only a little part of the tree is =
constantly changing ?
- What do you call a 'graph' when speaking about the structure the =
semantic layer uses to resolve paths ? How does this part really work =
(it is not formally spcified in the doc) ?
- How about folders : what status do they have ? They may be stored as =
other files, as they have to keep their own properties, but their =
information (the folder's files and subfolder list) is being kept in the =
semantic layer's graph : how do you handle with this ?
- Why do you need to store the locality_id in the key ?
- How do you handle with big files wich do not fit in contiguous bloc =
space, so they need more than one extended pointer ? How are those other =
pointers stored ?
- B+Trees are simply BTrees that do not use BLOBs, am I right ?
- Dancing trees are simply Balanced Trees wich are only modified in an =
event of memory pressure, don't they ?
- How is the developement ? I mean, should we await the Reiser 4.0 =
release this summer, or do you need some more time ? What features will =
be included in 4.0 and which will be left for 4.1 ? Will the packer be =
ready for release as Reiser 4.0 comes out ?

My goal is to provide a french, complete and exact FDL licensed =
documentation about Reiser4, hopefully before the next month. I'd just =
like you to help me, I'm sure you'll be able to.


Thank you in advance,

Fred
------=_NextPart_000_0009_01C30B7B.9B0EFEC0--

