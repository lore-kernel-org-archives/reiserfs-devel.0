From: Chris Mason <mason@suse.com>
Subject: Re: non volatile ram devices
Date: 06 Dec 2002 08:03:33 -0500
Message-ID: <1039179813.7803.7.camel@tiny>
References: <200212042059.35300.russell@coker.com.au>
	<200212051000.32340.russell@coker.com.au> <1039094639.8199.119.camel@tiny> 
	<200212061052.59139.russell@coker.com.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-DOTNRdPp/m4uzPvA3zYp"
Return-path: <reiserfs-list-return-12123-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200212061052.59139.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Russell Coker <russell@coker.com.au>
Cc: Ragnar =?ISO-8859-1?Q?Kj=F8rstad?= <linux-ide-arrays@ragnark.vestdata.no>, ReiserFS <reiserfs-list@namesys.com>, Mike Jadon <mikej@umem.com>


--=-DOTNRdPp/m4uzPvA3zYp
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2002-12-06 at 04:52, Russell Coker wrote:
 
> The results seem to show that the patches do some good on their own, nothing 
> really exciting but worth having.  The data journalling improves performance 
> of synchronously creating files in the 512b to 16K size range (the issue I am 
> interested in) by a factor of 7!  This is very promising, I only hope that 
> the performance gains when 200 processes are hitting a hardware RAID array of 
> 4 U160 disks are as good as when a single process is hitting a cheap old IDE 
> disk.
>

You should see a significant improvement over the old code as the number
of procs involved goes up.  The data logging patches have an
optimization andrew morton suggested, which is to schedule for a bit
during an fsync to allow other procs to get some work done and increase
the size of the transaction.  I've attached his synctest.c, which tries
to approximate a postfix mail load.  Check the difference between
data=journal and a pure kernel for

time synctest -F -f -n 1 -t 100 dir_name

(it does no timing on it's own, you'll have to run it under time)

This does fsyncs on both the file and the directory in a simulated
delivery.  It isn't a perfect benchmark, but it does hammer on fsyncs
nicely.

Another interesting metric is to use the reiserfs proc interface to
count the number of transactions required to finish each run.  (check
the transid in proc/fs/reiserfs/<disk>/journal)

-chris


--=-DOTNRdPp/m4uzPvA3zYp
Content-Disposition: attachment; filename=synctest.c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; name=synctest.c; charset=ISO-8859-1

/*
 * Test and benchmark synchronous operations.
 */

#undef _XOPEN_SOURCE	/* MAP_ANONYMOUS */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <stdarg.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/resource.h>
#include <sys/wait.h>
#include <sys/mman.h>

/*
 * Lots of yummy globals!
 */
char *progname, *dirname;
int verbose, use_fsync, use_osync;
int fsync_dir;
int n_threads =3D 1, n_iters =3D 100;
int *child_status;
int this_child_index;
int dir_fd;
int show_tids;
int threads_per_dir =3D 1;
int thread_group;
int do_unlink;
int rename_pass;

#define N_FILES		100
#define UNLINK_LAG	30
#define RENAME_PASSES	3

void show(char *fmt, ...)
{
	if (verbose) {
		va_list ap;

		va_start(ap, fmt);
		vfprintf(stdout, fmt, ap);
		fflush( stdout );
		va_end(ap);
	}
}

/*
 * - Create a file.
 * - Write some data to it
 * - Maybe fsync() it.
 * - Close it
 * - Maybe fsync() its parent dir
 * - rename() it.
 * - maybe fsync() its parent dir
 * - rename() it.
 * - maybe fsync() its parent dir
 * - rename() it.
 * - maybe fsync() its parent dir
 * - UNLINK_LAG files later, maybe unlink it.
 * - maybe fsync() its parent dir
 *
 * Repeat the above N_FILES times
 */

char *mk_dirname(void)
{
	char *ret =3D malloc(strlen(dirname) + 64);

	sprintf(ret, "%s/%05d", dirname, thread_group);
	return ret;
}

char *mk_filename(int fileno)
{
	char *ret =3D malloc(strlen(dirname) + 64);

	sprintf(ret, "%s/%05d/%05d-%05d",
			dirname, thread_group, getpid(), fileno);
	return ret;
}

char *mk_new_filename(int fileno, int pass)
{
	char *ret =3D malloc(strlen(dirname) + 64);

	sprintf(ret, "%s/%05d/%02d-%05d-%05d",
			dirname, thread_group, pass, getpid(), fileno);
	return ret;
}

void sync_dir(void)
{
	if (fsync_dir) {
		show("fsync(%s)\n", dirname);
		if (fsync(dir_fd) < 0) {
			fprintf(stderr, "%s: failed to fsync dir `%s': %s\n",
				progname, dirname, strerror(errno));
			exit(1);
		}
	}
}

void make_dir(void)
{
	char *n =3D mk_dirname();

	show("mkdir(%s)\n", n);
	if (mkdir(n, 0777) < 0) {
		fprintf(stderr, "%s: Cannot make directory `%s': %s\n",
			progname, n, strerror(errno));
		exit(1);
	}
	free(n);
}

void remove_dir(void)
{
	char *n =3D mk_dirname();
	show("rmdir(%s)\n", n);
	rmdir(n);
	free(n);
}

void write_stuff_to(int fd, char *name)
{
	static char buf[500000];
	static int to_write =3D 5000;

	show("write %d bytes to `%s'\n", sizeof(buf), name);
	if (write(fd, buf, to_write) !=3D to_write) {
		fprintf(stderr, "%s: failed to write %d bytes to `%s': %s\n",
			progname, to_write, name, strerror(errno));
		exit(1);
	}

	to_write *=3D 1.1;
	if (to_write > 250000)
		to_write =3D 5000;
}

void unlink_one_file(int fileno, int pass)
{
	if (do_unlink) {
		char *name =3D mk_new_filename(fileno, pass);

		show("unlink(%s)\n", name);
		if (unlink(name) < 0) {
			fprintf(stderr, "%s: failed to unlink `%s': %s\n",
				progname, name, strerror(errno));
			exit(1);
		}
		sync_dir();
		free(name);
	}
}

void do_one_file(int fileno)
{
	char *name =3D mk_filename(fileno);
	int fd, flags;

	flags =3D O_RDWR|O_CREAT|O_TRUNC;
	if (use_osync)
		flags |=3D O_SYNC;

	show("open(%s)\n", name);
	fd =3D open(name, flags, 0666);
	if (fd < 0) {
		fprintf(stderr, "%s: failed to create file `%s': %s\n",
			progname, name, strerror(errno));
		exit(1);
	}

	write_stuff_to(fd, name);

	if (use_fsync) {
		show("fsync(%s)\n", name);
		if (fsync(fd) < 0) {
			fprintf(stderr, "%s: failed to fsync `%s': %s\n",
				progname, name, strerror(errno));
			exit(1);
		}
	}

	show("close(%s)\n", name);
	if (close(fd) < 0) {
		fprintf(stderr, "%s: failed to close `%s': %s\n",
			progname, name, strerror(errno));
		exit(1);
	}

	sync_dir();

	for (rename_pass =3D 0; rename_pass < RENAME_PASSES; rename_pass++) {
		char *newname =3D mk_new_filename(fileno, rename_pass);

		show("rename(%s, %s)\n", name, newname);
		if (rename(name, newname) < 0) {
			fprintf(stderr,
				"%s: failed to rename `%s' to `%s': %s\n",
				progname, name, newname, strerror(errno));
			exit(1);
		}
		sync_dir();
		free(name);
		name =3D newname;
	}
	rename_pass--;
	free(name);
}

void do_child(void)
{
	int fileno;
	char *dn =3D mk_dirname();
	int dotcount;

	dir_fd =3D open(dn, O_RDONLY);
	if (dir_fd < 0) {
		fprintf(stderr, "%s: failed to open dir `%s': %s\n",
			progname, dn, strerror(errno));
		exit(1);
	}
	free(dn);

	dotcount =3D N_FILES / 10;
	if (dotcount =3D=3D 0)
		dotcount =3D 1;

	for (fileno =3D 0; fileno < N_FILES; fileno++) {
		if (fileno % dotcount =3D=3D 0) {
			printf(".");
			fflush(stdout);
		}
		do_one_file(fileno);
		if (fileno >=3D UNLINK_LAG)
			unlink_one_file(fileno - UNLINK_LAG, RENAME_PASSES - 1);
	}
	for (fileno =3D N_FILES - UNLINK_LAG; fileno < N_FILES; fileno++)
		unlink_one_file(fileno, RENAME_PASSES - 1);
}

void doit(void)
{
	int child;
	int children_left;

	child_status =3D (int *)mmap(	0,
				n_threads * sizeof(*child_status),
				PROT_READ|PROT_WRITE,
				MAP_SHARED|MAP_ANONYMOUS,
				-1,
				0);
	if (child_status =3D=3D MAP_FAILED) {
		perror("mmap");
		exit(1);
	}

	memset(child_status, 0, n_threads * sizeof(*child_status));

	thread_group =3D -1;
	for (this_child_index =3D 0;
			this_child_index < n_threads; this_child_index++)
	{
		if (this_child_index % threads_per_dir =3D=3D 0) {
			thread_group++;
			make_dir();
		}

		if (fork() =3D=3D 0) {
			int iter;

			for (iter =3D 0; iter < n_iters; iter++)
				do_child();
			child_status[this_child_index] =3D 1;
			exit(0);
		}
	}

	/* Parent */
	children_left =3D n_threads;
	while (children_left) {
		int status;

		if( wait3(&status, 0, 0) < 0 ) {
			if( errno !=3D EINTR ) {
				perror("wait3");
				exit(1);
			}
			continue;
		}
		for (child =3D 0; child < n_threads; child++) {
			if (child_status[child] =3D=3D 1) {
				child_status[child] =3D 2;
				printf("*");
				fflush(stdout);
				children_left--;
			}
		}
	}
	for (thread_group =3D 0;=20
			thread_group < ( n_threads / threads_per_dir );=20
			thread_group++ )
		remove_dir();

	printf("\n");
}

void usage(void)
{
	fprintf(stderr,
		"Usage: %s [-fFosuv] [-p threads-pre-dir ][-n iters] [-t threads] dirname=
\n",
			progname);
	fprintf(stderr, "        -f:    Use fsync() on close\n");=20
	fprintf(stderr, "        -F:    Use fsync() on parent dir\n");=20
	fprintf(stderr, "        -n:    Number of iterations\n");
	fprintf(stderr, "        -o:    Open files O_SYNC\n");
	fprintf(stderr, "        -p:    Number of threads per directory\n");
	fprintf(stderr, "        -t:    Number of threads\n");
	fprintf(stderr, "        -u:    Unlink files during test\n");
	fprintf(stderr, "        -v:    Verbose\n");=20
	fprintf(stderr, "   dirname:    Directory to run tests in\n");
	exit(1);
}


int main(int argc, char *argv[])
{
	int c;

	progname =3D argv[0];
	while ((c =3D getopt(argc, argv, "vFfout:n:p:")) !=3D -1) {
		switch (c) {
		case 'f':
			use_fsync++;
			break;
		case 'F':
			fsync_dir++;
			break;
		case 'n':
			n_iters =3D strtol(optarg, NULL, 10);
			break;
		case 'o':
			use_osync++;
			break;
		case 'p':
			threads_per_dir =3D strtol(optarg, NULL, 10);
			break;
		case 't':
			n_threads =3D strtol(optarg, NULL, 10);
			break;
		case 'u':
			do_unlink++;
			break;
		case 'v':
			verbose++;
			break;
		}
	}

	if (optind =3D=3D argc)
		usage();
	dirname =3D argv[optind++];
	if (optind !=3D argc)
		usage();

	doit();
	exit(0);
}

--=-DOTNRdPp/m4uzPvA3zYp--

