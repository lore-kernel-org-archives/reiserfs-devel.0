From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 as module
Date: Wed, 21 Jul 2004 22:50:20 -0500
Message-ID: <40FF397C.1000402@slaphack.com>
References: <20040721231748.46066.qmail@web60310.mail.yahoo.com> <1090461647.1676.16.camel@jeff>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19732-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1090461647.1676.16.camel@jeff>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeff Davis <reiser-list@empires.org>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Jeff Davis wrote:

| Does someone have a better suggestion for me? Is the unloading of
| reiser4 problem a bug? Am I not doing it correctly (this is my first
| kernel modification)?

I don't think reiser4 is really able to be a module right now.  I think
it's a bug, but not a high-priority one.  I think, I think, I think...

I don't know how to get UML to work with reiser4, but I'm sure it can be
done, as I've heard Namesys people say they use that to develop under.
So there, yes, you'd have to reboot your UML kernel, but you could be
doing other things while that happened -- and it wouldn't take long for
it to reboot anyway.

Also, you may want to use the bitkeeper tree to develop off.  Is that
still up?  http://namesys.com/code.html

| As a seperate issue, the plugin I'm trying to ultimately create is one
| where you can access a script by doing something like
| "/path/to/script.py/pyexe" and it would execute the script and the file
| contents would be (read only) the stdout. That would allow cool stuff
| like having a configuration file be just data pulled from a database (as
| an example). Is this even possible? I'm still trying to figure out how
| I'd write it in a secure way (we don't want to execute a user's script
| in kernel address space).

Possible, and may have some other uses.  But why would anyone want to
put config files in a database?  With reiser4's handling of small files
and things like NFS, I can't find a single reason.  Also, if you're
going to start python, run a python script which accesses a database,
take the results and send them to kernel space, then back to user space,
you're talking about serious performance issues vs. just leaving the
config files alone, as flat text.

Also, what you're proposing could be implemented without reiser4:

cd /path/to
mkfifo script.pipe
while true; do
	./script.py > script.pipe;
done

Run that, then go to another terminal and try 'cat'-ing
/path/to/script.pipe instead of /path/to/script.py/pyexe.  You may have
to ensure that script.py outputs an EOF character.

I don't know about the best way to implement it as a plugin.  Maybe keep
most of it in userland?


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQP85e3gHNmZLgCUhAQLdJA//SnsJU9/sVSu56ywbnyjXTyF8B4jdr8xy
b55zT51DRemlDvCVmEbTydc6qx58TL1g3eL67Nq2O3fXYSvuX6ROvdp2S3228PW5
GHN2/ARaL0VoYMpgy+nXkA5iTk+KGXnyZsJE03bMkDdrh4a2uXTvnNoYuajaiFuI
Sl3KVK/5vTD+EYZGYtGdtARGXi+mKLJeCAKsj021L35NnY508567zS9RBFAAgTDj
trSjt+EYMzTJ9Y4mO1BkFFOvqGZQJg6kPbLzZ6oUtoFpfMJRX688fgxVw1FOSsSx
HfjmSSa6RUJeC0JwK7aaWM2M/BSv7+00aP6lmTXC0JC8d01He0ynKU6RifCti6FS
Vif9fZsCpurMkTxh21Mv119H/oEy0shi+O82aoh7nvsB+ZLvvXbQLdnLAoJkseAR
pwBuryDVs7uT/gQmCA50gkWDeuRztRPCwYCyHa8C9dHQDLyLUJoWB25I/F+m1rIE
5Go8Vpzap46T9CHIFVxJRRSjm+yudw85IDTg0MS7h9uRnDDBT7oNFQjErSK7gLJd
IVdNg2rxHaknYN0guxyLWp5+depg4+rnl3/QIZeqe9rWi9rD0128U+FEs4P0firM
gzTC+XfOKExhTGdb3l+VO7YvFbSGegu9Fh5qTqfNlI9/4DkYZrLrfCz/7ZxzLCJ4
dNeKS/zPvog=
=WfBy
-----END PGP SIGNATURE-----
