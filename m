From: faraz ahmed <faraz_irulz@yahoo.com>
Subject: Re: ReConfigurable Directory Structure & Agrregation of files according to semantic.
Date: Tue, 16 Mar 2004 23:53:33 -0800 (PST)
Message-ID: <20040317075333.96561.qmail@web60404.mail.yahoo.com>
References: <20040317024931.GB5731@exavio.com.cn>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17265-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040317024931.GB5731@exavio.com.cn>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Isaac Claymore <clay@exavio.com.cn>
Cc: reiserfs-list@namesys.com

Hi Isaac;
         The user space implementation u are talking
about has to be done for each file type seperately.
Example the Winamp playlist can only organize mp3's
wherelese our FS can aggregate any type of data
becuase  each file has attribs (name,value pairs) .
And the directory listing is done acc Relational
queryies on these attributes.
          Anyways the Winamp playlist can only be used
by winamp & other application have no way to use the
files organized in a playlist. Where as in our case
the 
aggregation is done by the file system, so all apps 
can use the organization without change.
          Exactly we do our processing in the user
space & just display the results under the FS.(Micro
kernel sorts of)
                                Regards.
                                 Faraz.

--- Isaac Claymore <clay@exavio.com.cn> wrote:
> Hi,
> 
> I'm new to this idea, and am no fs expert. But it
> looks to me very
> much like what Apple is doing on their iPods, I
> happen to have just
> bought one iPod last weekend.
> 
> Internally, the audio files are stored on a HFS+
> filesystem, under a 
> hierarchy structure very weird to us humans. But, by
> using iPod or the
> iTunes tool, the files are presented under various
> hierachy structures
> organized by file meta data, like artist, album,
> composer... And, that's
> far too convenient.
> 
> I guess this kind of stuff can be done in user
> space, well and
> elegantly. Either a specialized application(e.g.
> iTunes), or some kind
> of user space filesystem will do. I also think this
> is best suited
> for storage of multimedia files, which naturelly
> come with much meta
> data. And, I fail to figure out what benefit this
> can do to regular
> system files, like those under /etc, /boot...
> 
> HTH~~
> 
> 
> -Isaac
> 
> On Tue, Mar 16, 2004 at 02:45:23PM -0800, faraz
> ahmed wrote:
> > Hi EveryBody;
> > Iam an final year engneering student and as part
> of
> > our final year project we have implemented a
> > filesysten which  
> > support more than 1 Directory Structures for the
> same
> > set of files. Each Directory Structure is a XML
> file
> > discribing the directory structure as well as the
> > attributes of the Files to be listed under Each
> > directory. The file system the mounts this XML
> file &
> > produces the directory listing by querying the FS
> for
> > files which match the criteria. The Project will
> soon
> > be made public under GPL. Following is the
> abstract.
> > Please guide me with your valuable suggestions.
> > 
> > 
> > //==============================================
> > 1. Idea of our project:
> > //==============================================
> > The aim of this project is to implement a solution
> > that provides file-level host-based virtualization
> > that provides for better aggregation of
> > content/information based on semantics and
> properties.
> > File-system organization today very closely
> mirrors
> > storage paradigms rather than user-access
> paradigms
> > and semantic grouping. All file-system hierarchies
> are
> > containers that are expressed based on their
> physical
> > presence (a separate drive letter on Windows, or a
> > particular mount point based on the volume in
> Unix). 
> > We wish to implement a solution that will allow
> users
> > to organize their files based on their
> convenience. We
> > define this convenience in the following forms: 
> > 
> > The ability to organize the namespace based on
> certain
> > attribute properties (file-system metadata
> > virtualization). 
> > Ex Directory Listing as an output of high level
> > relational query based on file attributes.
> > 
> > The ability to de-link position of a file in the
> > hierarchy from its actual storage (file metadata
> > virtualization) 
> > Ex Directory Listing as an output of high level
> > relational query based on file attributes.
> > 
> > The ability to de-link position of a file in the
> > hierarchy from its actual storage (file metadata
> > virtualization) 
> > Ex Automatically Listing the files with the proper
> > attributes in the respective directories. Create &
> > forget file system now puts your MP3 file in the
> right
> > folder no matter where they are stored on the
> disk.
> > 
> > The ability to create and manipulate namespaces
> using
> > well-known metaphors (XML schema descriptions and
> > schema editors) 
> > Ex. Define the directory structure with directory
> > query as an XML file. Mount multiple such
> directory
> > structures (virtualization). There by allowing
> > multiple organizational views for the same set of
> > files.
> > 
> > The ability to continue using the standard
> metaphors
> > for manipulation and access to information
> > (file-system kernel API?s), thus maintaining
> current
> > large body of applications unbroken) .
> > Ex. Make all this features available as an
> standard
> > file system so existing apps wont fail
> > 
> > __________________________________
> > Do you Yahoo!?
> > Yahoo! Mail - More reliable, more storage, less
> spam
> > http://mail.yahoo.com
> 
> -- 
> 
> Regards, Isaac
> ()  ascii ribbon campaign - against html e-mail
> /\                        - against microsoft
> attachments
> 

> ATTACHMENT part 2 application/pgp-signature
name=signature.asc



__________________________________
Do you Yahoo!?
Yahoo! Mail - More reliable, more storage, less spam
http://mail.yahoo.com
