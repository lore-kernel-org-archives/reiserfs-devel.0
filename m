From: Philippe =?ISO-8859-1?B?R3JhbW91bGzp?= <philippe.gramoulle@mmania.com>
Subject: Re: [OT] memory issue with GNU find
Date: Thu, 24 Oct 2002 18:30:06 +0200
Message-ID: <20021024183006.39d01225.philippe.gramoulle@mmania.com>
References: <20021024174330.34f2d72e.philippe.gramoulle@mmania.com>
	<1035474886.28715.182.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11762-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1035474886.28715.182.camel@tiny>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On 24 Oct 2002 11:54:45 -0400
Chris Mason <mason@suse.com> wrote:

  |  
  |   Exactly how are you running the find?

Like this:

find /path-to-list -type f ! -user root

Philippe
