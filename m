From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: On plugins, on-disk formatting and such
Date: Mon, 12 Apr 2004 16:39:56 +0300
Message-ID: <20040412133956.GE14134@nysv.org>
References: <20040410100701.GE5229@nysv.org> <20040412133006.GA1579@backtop.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17865-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040412133006.GA1579@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Mon, Apr 12, 2004 at 05:30:06PM +0400, Alex Zarochentsev wrote:

>2 APIs are: pseudo files and reiser4 syscall.

And syscalls will get a new set of programs to access them?

>reiser4 is able to store plugin sets (list of plugin ids for the object) as 
>a part of the object's stat data.

Is this doable only through syscalls?
If I have ext-3 fibration on /home/mjt/movies/ and reboot, what will I
have to do so the fibration doesn't change to dot-o after the reboot?
Apart from having another default in the mount options but that's not
what I'm after ;)

I actually haven't tested this, so it might even be standard behaviour ;)

>we still see fs errors if COC enable. they are rare now, but COC is not stable
>yet.

What sort of errors, please?
Real breakage, file inaccessibility or failed writes or..?

>>    But what is the secret? Atomic transactions?
>I think it is a feature of delayed block allocation. 

I tried to check namesys.com but didn't find anything.
Is this something that could be explained a bit more clearly?

Thanks for the answers and happy cosmonautics day!

BTW, I did an apt-get source glibc on my Reiser4 root partition.
I'm waiting for dpkg-buildpackage to either complete or fail, so maybe
we'll see what's amatter here.

-- 
mjt

