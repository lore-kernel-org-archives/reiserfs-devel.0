From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Where is reiserfsprogs?
Date: Wed, 10 Oct 2012 11:11:07 -0400
Message-ID: <5075900B.9060402@suse.com>
References: <alpine.DEB.2.01.1209241627360.10880@trent.utfs.org> <50610261.20307@suse.com> <alpine.DEB.2.01.1209242016500.10880@trent.utfs.org> <506125F1.4030500@suse.com> <50619895.7000003@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <50619895.7000003@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Christian Kujau <lists@nerdbynature.de>, reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 9/25/12 7:42 AM, Edward Shishkin wrote:
> On 09/25/2012 05:33 AM, Jeff Mahoney wrote:
>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>> 
>> On 9/24/12 11:19 PM, Christian Kujau wrote:
>>> On Mon, 24 Sep 2012 at 21:01, Jeff Mahoney wrote:
>>>> I don't know if there's an official site anymore. You can
>>>> grab 3.6.21 from the "filesystems" project in the open build 
>>>> service[1]
>>> 
>>> Thanks!
>>> 
>>> @Edward, do you want to add this to your Sorceforge account? Or
>>> can you put this back on your kernel.org home? Or do we want to
>>> have the openSUSE build service to be the new "official" place
>>> for reiserfsprogs?
>> 
>> While I wouldn't mind seeing the publicity for OBS, that's not
>> really the goal of the project.
>> 
>> Edward, it's up to you. I know you don't do much with reiser3
>> anymore. I can apply for and host it at a kernel.org account if
>> you'd prefer. I have an outstanding patch anyway.
> 
> 
> OK, try to apply.
> 
> I am sorry, currently this is a problem for me to collect needed
> amount of signatures to recreate my account at kernel.org.

Ok. I've published the versions of reiserfsprogs that SUSE has shipped
in products (so I know that they're valid). Our ftp.namesys.com
archive has long since been empty, so that's really the best I can do.

That means the following versions:
3.x.0j
3.6.2
3.6.4
3.6.9
3.6.13
3.6.18
3.6.19
3.6.20
3.6.21

http://ftp.kernel.org/pub/linux/kernel/people/jeffm/reiserfsprogs

Incidentally, the SUSE version of 3.6.21 has for some time carried
patches for signedness and a use-after-free. If nobody has any
objections, I'll publish that as 3.6.22.

- -Jeff

- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.18 (Darwin)
Comment: GPGTools - http://gpgtools.org
Comment: Using GnuPG with Mozilla - http://www.enigmail.net/

iQIcBAEBAgAGBQJQdZALAAoJEB57S2MheeWycX4QAKY3VfIHzMBMlN27dco4SnmW
UFxNAkoTD06D4sp5XZkypa0PqCSCgcgWgUxE8Zc9+JYJJIYTDvSs3bEhs6ZjQwax
mSVNPwyLoQTAuGkY5O7xTL19qQPR0IjfZ9JoM+u1bATHJVUsjatiequfhwyvNZqI
TlarcV1DbgBYjVPmeKQubI2sgteQ9n1kzAnYwvPkl7dgk2uWXgb836CjY2EjGrJh
5b+i//B6v7yTS/kq68ddHEuQOmtneoCBnrVUpuu28Z8HyHoqDE42EgSsgb11aDsF
uxzj07IoJI9ggJhY6CEB4ZVO/o9PxXVJtyp8A2olL6LYtS52etZbx1Ks8cn8R/yL
XN/I8phI4iRTEvMTr6HZ1hjlD7ZeyAFJzxeWmfAonzTxqDrlYcqs6HRmVM2MBiIG
5IKX1NnCgRiBFSoyyHZxpe0YOhVY+Y5wuQRXksBCmfz/dj4wdC7/cUfC5RFFof/M
V+BDXTIofFZDLjMmK5dvr4Ym49nOvtcqrvyvQ7BZNtxaEGw9QhC3E1VNikWCvuNo
rwVNBc8KnXIKfeClggVm1DIUOAvnFfBhPsWvRH6kATsIUDRzmoQnD9L84jPtERMK
3R+fng6sMbtbqRyJXUftJWZNr3OGwz3HpdN9a6t1YRESyXYduhHUcdQhnjtls3XA
wJr9GixC4tsqbvz3RY5m
=M3Z4
-----END PGP SIGNATURE-----
