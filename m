From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH 2/2] reiserfs: Add mount counting
Date: Mon, 03 Dec 2007 18:00:32 -0500
Message-ID: <47548A90.3060805@suse.com>
References: <474B4BCF.1000905@suse.com> <47545D0D.6080608@suse.com>	 <5c7c368b0712031236i33abc7bdtd7a14354c67169b3@mail.gmail.com>	 <475469B8.4050004@suse.com>	 <5c7c368b0712031251w75febd3bve5aee70c4935a7c9@mail.gmail.com>	 <475475E5.1010400@suse.com> <5c7c368b0712031456p120634behc13f2d546df8659b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <5c7c368b0712031456p120634behc13f2d546df8659b@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>, Vladimir Saveliev <Vladimir.Saveliev@sun.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Edward Shishkin wrote:
> On 12/4/07, Jeff Mahoney <jeffm@suse.com> wrote:
> Edward Shishkin wrote:
>>>> On 12/3/07, Jeff Mahoney <jeffm@suse.com> wrote:
>>>> Edward Shishkin wrote:
>>>>>>> Hi Jeff.
>>>>>>>
>>>>>>> Personally, I don't object.
>>>>>>> What does official reservation mean?
>>>>>>> I can send a request to Hans, but I guess
>>>>>>> we'll receive his "yes" or "no" with substantial delay..
>>>> I just mean that those 12 bytes in the superblock are guaranteed not to
>>>> be used for something else. Given the pace of reiserfs development, I
>>>> don't expect this to be a problem as there are 76 more of them. :)
>>>>
>>>>> Well, I promise to not use them for something else ;)
> Great. That's the assurance I was looking for. :)
> 
>>>>> It seems we need something like reiserfsprogs-3.6.20?
> I actually posted a patch against reiserfsprogs-3.6.20 that reserves the
> same fields. It also implements the use of those fields. I have an
> updated version that treats timestamps in the future as suspect and
> forces a check. I'll post the update later today.
> 
>> Sorry, I am a bit confused..
>> The latest git version of reiserfsprogs is 3.6.19;
>> The latest website version is also 3.6.19.
>> At the same time I can google and see that some distros
>> use reiserfsprogs-3.6.20.
>> Suse 10.3 uses "reiserfs utility package" 3.6.19-92
>> Also I remember that Vladimir worked on some version
>> of reiserfsprogs not so long ago.
> 
>> Any ideas about really latest version?

I think Vladimir must have released what he was working on as 3.6.20.
That's the latest version I downloaded from ftp.namesys.com.

It reorganizes the code into a saner structure as well as cleans up the
code quite a bit. It also adds the > 8 TB support that I ended up
grafting onto 3.6.19 for our release.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4-svn0 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFHVIqPLPWxlyuTD7IRAlHNAJ90Czg1ZIcwodr0JBZuZ48oXdB1PQCePiwN
i2hQJPXkmUU2P+ZPbSkecRk=
=CXkg
-----END PGP SIGNATURE-----
