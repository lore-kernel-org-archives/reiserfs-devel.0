From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: File copy problems kde 4.5 to 4.6.1 with reiser4
Date: Tue, 15 Mar 2011 18:35:18 +0100
Message-ID: <4D7FA356.1000309@gmail.com>
References: <201103090918.47762.berny@dwami.com> <AANLkTikRbBP=XeNtvMkN=jYDVcuTZdqAM5bM=5NeAn=q@mail.gmail.com> <4D7774D7.3030908@dwami.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4D7774D7.3030908@dwami.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Berny <berny@dwami.com>
Cc: reiserfs-devel@vger.kernel.org, Serkan Kaba <serkan@gentoo.org>

On 03/09/2011 01:38 PM, Berny wrote:
> On 03/09/2011 10:32 AM, Serkan Kaba wrote:
>> 2011/3/9 berny=AE<berny@dwami.com>:
>>> Hi Edward,
>>> first thank you for your work.
>>>
>>> I'm using reiser4 for all my partitions on my working machine with
>>> kernel 2.6.37 with no problems
>>> except one annoying one that is going on from months.
>>> When I copy a file (whatever) from one directory to another with
>>> konqueror, dolphin or krusader with
>>> kde 4.6.1 the file get copied, it's size is correct but it is empty=
=2E
>>>
>>> This happen only in the partitions formatted with reiser4 and not o=
n
>>> the xfs, reiser3 ones.
>>>
>>>
>>> Thank you,
>>> warm regards,
>>> Paolo
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe
>>> reiserfs-devel" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>>>
>>
>> I suspect that it's similar to what I experienced with gnome upgrade
>> back in time. My problem was due to issues in splice code path which
>> GNOME switch to for file copying along the way. I already reported
>> this to GNOME [1] as well as this ML [2,3]. The issue appearing in
>> only uncompressed partitions is interesting, Edward already asked me

It seems this is because of the following not implemented "todo":

int write_begin_unix_file(struct file *file, struct page *page,
			  loff_t pos, unsigned len, void **fsdata)
{

=2E..
	if (info->container =3D=3D UF_CONTAINER_TAILS) {
		warning("edward-1563", "Option not implemented");
		drop_exclusive_access(info);
		return -EINVAL;
	}

Tail conversion should go in this branch.
I'll try to implement it for .38, and we'll see,
if this was really the issue.

Thanks,
Edward.


>> if mine was, which isn't. My current workaround is to use a patched
>> version of glib (part of gnome libs) that avoids using splice for
>> reiser4 targets. If you have a KDE bugzilla account, can you also
>> provide them links for discussions in the list as well as the GNOME
>> bug?
>>
>> 1: https://bugzilla.gnome.org/show_bug.cgi?id=3D615346
>> 2: http://marc.info/?l=3Dreiserfs-devel&m=3D127096098705179&w=3D2
>> 3: http://marc.info/?l=3Dreiserfs-devel&m=3D129275181431455&w=3D2
>> --
>
> So it seems that also kde probably use this library to splice data fr=
om
> a pipe, I saw that it seemed resolved in 2.6.36 but it is here again =
in
> 2.6.37.
> I read your links, very good information.
> I never know that kde was using this splice for copying things.
> Sorry but I'm not member of kde bugzilla, I was simply searching for
> information.
> The problem is that only reiser4 exhibit this problem on my system so=
 I
> guessed that was a problem of this file system, this is the reason
> because I didn't fill a bug on the other bugzilla.
>
> Thanks,
> Paolo
>
>
>> To unsubscribe from this list: send the line "unsubscribe
>> reiserfs-devel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>
> --
> To unsubscribe from this list: send the line "unsubscribe
> reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
