From: Kuba Ober <kuba@mareimbrium.org>
Subject: Re: A couple of questions
Date: Fri, 17 May 2002 12:03:21 -0400
Message-ID: <200205171203.21328.kuba@mareimbrium.org>
References: <93F527C91A6ED411AFE10050040665D0049BFA37@corpusmx1.us.dg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10369-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <93F527C91A6ED411AFE10050040665D0049BFA37@corpusmx1.us.dg.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: berthiaume_wayne@emc.com
Cc: reiserfs-list@namesys.com

On pi=B1tek 17 maj 2002 09:11 am, berthiaume_wayne@emc.com wrote:
> Kuba, I guess the question that should be posed this way: What is
> the downside of not asking the user and just fixing what can be fixed? Is
> there a potential for unrepairable damage if you were to fix blindly
> without "user" intervention?

The downside is that with fsck's that are quick hacks, you really require u=
ser=20
to know a lot, and you ask complicated questions.

Fsck should *first* get all the information it can from the fs and digest i=
t.=20
Only then can it try to fix things, and ask questions about things that are=
=20
doubtful. There are certain things that are 99.999995 true, almost=20
assertions, because certain damage patterns have extremely slim chances of =

occuring.

This is essentially a way to formulate fsck algorithm in terms similar to s=
ome=20
expert systems.

Example: I'll use FAT16 for the example fs, since I assume most people know=
 it=20
well enough. With FAT16 filesystem, it was quite easy to discern clusters=20
occupied by directories from clusters occupied by file data. And then, ther=
e=20
was more data that increased the probablity that you indeed had a proper=20
directory cluster. It might have went in steps:
(assuming all fat copies were zeroed)
1. Read all disk clusters, detect those that are probable directories basin=
g=20
solely on cluster contents. Define an "is-directory" property for each=20
cluster. Assign 0 to this property in those clusters which failed detection=
=20
in this step, and 0.8 to clusters which were detected.
2. Check for mutual links between directories detected thus far (the forwar=
d=20
and backward links). Bump the "is-directory" probabilities for clusters tha=
t=20
have passed to 1.0.
3. Assign "is-first-cluster" probabilities for all clusters. Set them to va=
lue=20
of "is-directory" from the directory cluster that contained an entry pointi=
ng=20
to this cluster, or 0 if nothing points to them.
4. Check for consecutive directory clusters, starting at all clusters havin=
g=20
is-first-cluster > 0 && is-directory > 0. Bump "is-directory" basing on=20
best-known neighbors, etc, ...

There were many shortcuts taken here, since I ignore multiply-linked entrie=
s,=20
loops, etc. It was meant as example of the idea, not implementation.  There=
=20
is a lot of what-if kind of approach in fs recovery, and by providing an=20
expert-system fuzzy-logic (ie non-binary) approach, there can be a lot of=20
knowledge gained about a filesystem without asking a single question. We're=
=20
really looking for answers if we depend on a piece of information in doing =
a=20
recovery decision, and we consider the information we have to be too=20
doubtful.

That also means that the fsck/recovery program needs to do a lot of stuff, =
a=20
lot more than one thinks. The typical "multi-pass" approach where errors ar=
e=20
fixed from lower-level to higher-level is wrong, since it inherently either=
=20
looses information, or doesn't have it yet in earlier steps.

There can be only three passes: gather data from the media, ask additional =

questions to the user if they are needed, do the fixes. I don't see it any =

other way, and I was always thinking of an ideal fsck tool in these terms=20
since I was about 12 (late 80's, already had a third HD in my 286/8 machine=
,=20
and had done a few recovery operations with diskeditor). An example of wron=
g=20
approach is say norton disk doctor, on FAT16: it would first check FAT, fix=
=20
that, and only afterwards check & fix directory structure -- it looses a lo=
t=20
of information that each of the passes keeps to itself, eg. fixing cluster =

chains in FAT doesn't really look at what those clusters contain, etc.

Cheers, Kuba
