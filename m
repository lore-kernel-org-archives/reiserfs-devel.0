From: Tom Vier <tmv@comcast.net>
Subject: attrib +A doesn't work
Date: Wed, 04 Sep 2002 23:43:20 -0400
Message-ID: <20020905034320.GA11951@yzero>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-11370-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

i thought 3.6 support attribs (or at least some of them), but A isn't
working. i ran touch test; chattr +A test; stat test; cat test; stat test;
the second stat showed an updated atime.

is there some undocumented mount option to enable attribs?

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0xE6CB97DA
