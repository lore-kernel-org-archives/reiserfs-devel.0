From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: File as a directory - VFS Changes
Date: Tue, 31 May 2005 20:00:37 +0400
Message-ID: <17052.35365.837251.39065@gargle.gargle.HOWL>
References: <17050.62052.318426.711322@gargle.gargle.HOWL>
	<75229416615-BeMail@cr593174-a>
	<17052.12223.708707.757538@gargle.gargle.HOWL>
	<429C7D0A.6040200@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24231-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <429C7D0A.6040200@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: "Alexander G. M. Smith" <agmsmith@rogers.com>, leocomerford@gmail.com, reiserfs-list@namesys.com, ninja@slaphack.com

Hello Hans,

Hans Reiser writes:
 > Nikita Danilov wrote:
 > 
 > >Alexander G. M. Smith writes:
 > > > Nikita Danilov wrote on Mon, 30 May 2005 15:00:52 +0400:
 > > > > Nothing in VFS prevents files from supporting both read(2) and
 > > > > readdir(3). The problem is with link(2): VFS assumes that directories
 > > > > form _tree_, that is, every directory has well-defined parent.
 > > > 
 > > > At least that's one problem that's solveable.  Just define one of
 > > > the parents as the master parent directory, with a guaranteed path
 > > > up to the root, and have the others as auxiliary parents.  That
 > > > also gives you a good path name to each and every file-thing.
 > > > 
 > > > The VFS or the file system (depending on where the designers want
 > > > to split the work) will still have to handle cycles in the graph
 > > > to recompute the new master parents, when an old one gets deleted
 > > > or moved.
 > >
 > >Cycle may consists of more graph nodes than fits into memory. 
 > >
 > There are pathname length restrictions already in the kernel that should
 > prevent that, yes?

UNIX namespaces are not _that_ retarded. :-)

int main(int argc, char **argv)
{
        int i;

        for (i = 0; ; ++ i) {
                mkdir("foo", 0777);
                chdir("foo");
                if ((i % 1000) == 0)
                        printf("%i\n", i);
        }
        return 0;
}

run it for a while, interrupt, and do

$ find foo
$ rm -frv foo

 > 
 > >Cycle
 > >detection is crucial for rename semantics, and if
 > >cycle-just-about-to-be-formed doesn't fit into memory it's not clear how
 > >to detect it, because tree has to be locked while checked for cycles, and
 > >one definitely doesn't want to keep such a lock over IO.
 > >
 > > > 
 > > > - Alex
 > >

Nikita.

 > >
 > >
 > >  
 > >
