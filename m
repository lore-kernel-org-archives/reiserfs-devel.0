From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: RE: ".meta." as a Name Prefix
Date: Thu, 22 Apr 2004 20:18:36 -0400 EDT
Message-ID: <2452111248-BeMail@cr593174-a>
References: <3DF9165145FACB4C96977FF650C1E9040C469E75@its-mail1.its.corp.gwl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18167-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DF9165145FACB4C96977FF650C1E9040C469E75@its-mail1.its.corp.gwl.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Burnes, James" <james.burnes@gwl.com>
Cc: reiserfs-list@namesys.com

Burnes, James wrote on Wed, 21 Apr 2004 17:10:00 -0600:
> In the same way that 'ls <directory>' is ambigous.  Does it mean I want
> to look at the attributes of the directory itself, or does it mean that
> I'm referring to the contents of the directory?  That's why they
> invented 'ls -d'

Good analog.  There would have to be some OS and application level
changes to support having both read/writeable data and child objects.
For backwards compatiblity, calling ReadDir() would likely hint that
you want a list of child objects, and read() means you want the data.
The feature I want is that you can do both to any file system object.
Plus of course indexing of attributes and other BeOS style goodies.

- Alex
