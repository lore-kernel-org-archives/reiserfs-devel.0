From: Gregor Zeitlinger <zeitling@informatik.hu-berlin.de>
Subject: Re: Reiser4 as positional B-Tree
Date: Tue, 4 Nov 2003 23:06:30 +0100 (CET)
Message-ID: <Pine.LNX.4.33.0311042237040.13378-100000@mitte.informatik.hu-berlin.de>
References: <3FA76AAA.8080600@namesys.com>
Reply-To: Gregor Zeitlinger <gregor@zeitlinger.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15970-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FA76AAA.8080600@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs mailing list <reiserfs-list@namesys.com>

On Tue, 4 Nov 2003, Hans Reiser wrote:
> Please send a definition of a positional B-tree.
It's like a B+-Tree but handles strings. You can insert, search and delete
strings according to their poisition in the tree. It's basically like a
unix file with the capability of inserting and removing text in the middle
of a file.

> Also indicate whether you are an individual vs. an organization
I'm doing the project as a university project.

> that might be interested in sponsoring our creating a plugin of that
> kind to your specifications.
If the project turns out to be successfull, other students might work on
it, yes. Other than that - our university is located in Berlin which is
broke...

-- 
Gregor Zeitlinger
gregor@zeitlinger.de

