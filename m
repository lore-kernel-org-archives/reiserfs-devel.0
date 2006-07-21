From: Pysiak Satriani <pysiak.satriani@wp.pl>
Subject: storing images thumbnails as pseudo files?
Date: Fri, 21 Jul 2006 21:29:32 +0200
Message-ID: <5710000871.20060721212932@wp.pl>
Reply-To: Pysiak Satriani <pysiak.satriani@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29107-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com, reiserfs-list@namesys.com

Hello,

suppose pseudo files, file-as-directory are on my r4 partition and are usuable.

Does namesys' vision allow things like storing image thumbnails "inside the file
itself" ?

Example using jpgtn (jpgtn creates thumbnails of jpg files)

// create 150px thumbnail
$ jpgtn -s 150 -H test.jpg

// move the thumbnail "into" the file
$ mv tn_test test.jpg/thumbs/150px

// the same but a 100px thumbnail
$ jpgtn -s 100 -H test.jpg
$ mv tn_test test.jpg/thumbs/100px

Then I could write HTML code like this:

<a href="test.jpg"><img src="test.jpg/thumbs/150px" /></a>

This idea came to me because of a project that has to create many thumbnails
for many files. That requires to make a naming scheme, parse filenames and
don't make one mistake. If I could do things this way it would be much
easier and elegant to do.

But that's just an idea from someone not really knowledgible enough in
the area.

Best regards,
Maciej Soltysiak


