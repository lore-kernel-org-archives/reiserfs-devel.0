From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH CFT] tons of logging patches
Date: 20 Jun 2002 20:25:59 -0400
Message-ID: <1024619159.2123.94.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10774-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <1024340679.18666.36.camel@tiny>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>, tomlins@cam.org, reiserfs-list <reiserfs-list@namesys.com>


ftp.suse.com/pub/people/mason/patches/data-logging has a new
beta-data-logging-10.diff.gz

This one:

compiles as a module (thanks Jeff Mahoney)

has a highmem bug fixed with data=journal (help from Andrea)

Fixes a problem with relocated/different sized journal devices.  This
was a merge error on my part.

One tester reports a hang that I can't reproduce here, I'm still trying.

-chris


