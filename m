From: Toby Dickenson <tdickenson@geminidataloggers.com>
Subject: Re: fsync() Performance Issue
Date: Mon, 29 Apr 2002 17:32:39 +0100
Message-ID: <6tsqcu0887p2396p14cn2krqrhh1o0dhfk@4ax.com>
References: <93F527C91A6ED411AFE10050040665D0049BF961@corpusmx1.us.dg.com> <20020429162020.92AD93EA8@lyta.coker.com.au>
Reply-To: tdickenson@geminidataloggers.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10196-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020429162020.92AD93EA8@lyta.coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Russell Coker <russell@coker.com.au>
Cc: berthiaume_wayne@emc.com, reiserfs-list@namesys.com

On Mon, 29 Apr 2002 18:20:18 +0200, Russell Coker
<russell@coker.com.au> wrote:

>On Fri, 26 Apr 2002 22:28, berthiaume_wayne@emc.com wrote:
>
>It's interesting to note your email address and what it implies...
>
>> 	I'm wondering if anyone out there may have some suggestions on how
>> to improve the performance of a system employing fsync(). I have to be=
 able
>> to guaranty that every write to my fileserver is on disk when the =
client
>> has passed it to the server. Therefore, I have disabled write cache on=
 the
>> disk and issue an fsync() per file. I'm running 2.4.19-pre7, reiserfs
>> 3.6.25, without additional patches. I have seen some discussions out =
here
>> about various other "speed-up" patches and am wondering if I need to =
add
>> these to 2.4.19-pre7? And what they are and where can I obtain said
>> patches? Also, I'm wondering if there is another solution to syncing =
the
>> data that is faster than fsync(). Testing, thusfar, has shown a large
>> disparity between running with and without sync.Another idea is to =
explore
>> another filesystem, but I'm not exactly excited by the other =
journaling
>> filesystems out there at this time. All ideas will be greatly =
appreciated.
>
>These issues have been discussed a few times, but not with any results =
as=20
>exciting as you might hope for.  One which was mentioned was using=20
>fdatasync() instead of fsync().
>
>One thing that has occurred to me (which has not been previously =
discussed as=20
>far as I recall) is the possibility for using sync() instead of fsync() =
if=20
>you can accumulate a number of files (and therefore replace many =
fsync()'s=20
>with one sync() ).

I can see

write to file A
write to file B
write to file C
sync

might be faster than

write to file A
fsync A
write to file B
fsync B
write to file C
fsync C

but is it possible for it to be faster than

write to file A
write to file B
write to file C
fsync A
fsync B
fsync C

?



Toby Dickenson
tdickenson@geminidataloggers.com
