From: "Tom Reinhart" <rhino_tom@hotmail.com>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
Date: Tue, 15 Aug 2006 19:53:59 -0700
Message-ID: <BAY19-F10C6C4C642E5B409C1790D944C0@phx.gbl>
References: <44E24563.1040900@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29611-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44E24563.1040900@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: edward@namesys.com
Cc: reiserfs-list@namesys.com


>From: Edward Shishkin <edward@namesys.com>

>Actually we dont need a special API: kernel should warn and recommend
>running fsck, which scans the whole tree and handles blocks with bad
>checksums.

Running fsck requires taking filesystem offline and having downtime.  No=20
fun.  :(

Correcting individual data errors can be done quickly and on-line as long a=
s=20
there exists a subset of the RAID that can reconstruct the correct data=20
(with the correct checksum).

_________________________________________________________________
Don=92t just search. Find. Check out the new MSN Search!=20
http://search.msn.click-url.com/go/onm00200636ave/direct/01/

