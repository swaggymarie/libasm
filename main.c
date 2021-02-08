#include "libasm.h"
#include <stdlib.h>

//rdi rsi rdx
//errno
void ft_check_strlen(void)
{
    printf("\n|%zu|\n", strlen("Hello"));
    printf("salut\n");
    printf("\n|%zu|\n", ft_strlen("Hello"));
    printf("%%%%%%%%%%%%\n");
    printf("\n|%zu|\n", ft_write(3 , NULL, 3));
    //printf("\nreturn : [%zd]\n", ft_write(1, "Hello World !", 13));
}

void check_strcmp(char *s1, char *s2)
{
    
    if (strcmp(s1, s2) == ft_strcmp(s1, s2))
		printf("" GREEN "[OK] " RESET "");
	else
		printf("" RED "[KO] " RESET "");
}

void check_strdup()
{
	char	dup[] = "New Malloc";
	//char	dup1[] = "little";
    printf("FT STRDUP\n");
	printf("return : |%s|\n", ft_strdup(dup));
    printf("dup terminé\n");
}

void    strdup_test(char *str)
{
    char	*str1;
	char	*str2;

	str1 = ft_strdup(str);
    printf("%s\n", str1);
	str2 = strdup(str);
    printf("---> %s\n", str2);
	if (!strcmp(str1, str2))
		printf("" GREEN "[OK] " RESET "");
	else
		printf("" RED "[KO] " RESET "");

    printf("..........................\n");
	free(str1);
	free(str2);
}

void check_strcpy()
{
    char str1[]= "cocu";
    char str2[]= "ptdr";

    ft_strcpy("coucou", "slut");
    printf("plplpl\n");

    printf("\n%s\n", ft_strcpy(str1, str2));
    printf("re === %s\n", str1);
}
int		strcpy_test(char *src)
{
	char	dest1[57];
	char	dest2[57];

	bzero(dest1, 57);
	bzero(dest2, 57);
	ft_strcpy(dest1, src);
	strcpy(dest2, src);
    printf("#################\n");
	if (!strcmp(dest1, dest2))
		printf("" GREEN "[OK] " RESET "");
	else
		printf("" RED "[KO] " RESET "");
    printf("%s\n", dest1);
    	char	str1[] = "Bonjour";
	char	str2[] = "Hello";
	char	str3[] = "libc most power full";
	char	str4[] = "libasm is for the ";
	char	str5[] = "petit";
	char	str6[] = "grand";
	char	str7[] = "";
	printf("============================================\n");
	printf("================ Ft_strcpy =================\n");
	printf("============================================\n\n");
	printf("\033[36mresultat : libasm\033[00m\n");
	printf("return : |%s|\n", ft_strcpy(str1, str2));
	printf("\033[36mresultat : libc\033[00m\n");
	printf("return : |%s|\n\n", strcpy(str1, str2));
	printf("\033[36mresultat : libasm\033[00m\n");
	printf("return : |%s|\n", ft_strcpy(str3, str4));
	printf("\033[36mresultat : libc\033[00m\n");
	printf("return : |%s|\n\n", strcpy(str3, str4));
	printf("\033[36mresultat : libasm\033[00m\n");
	printf("return : |%s|\n", ft_strcpy(str5, str6));
	printf("\033[36mresultat : libc\033[00m\n");
	printf("return : |%s|\n\n", strcpy(str5, str6));
	printf("\033[36mresultat : libasm\033[00m\n");
	printf("return : |%s|\n", ft_strcpy(str6, str7));
	return (1);
}
void	list_add_back(t_list **alst, t_list *new)
{
	t_list	*tmp;

	if (!alst || !new)
		return ;
	if (*alst)
	{
		tmp = *alst;
		while (tmp->next)
			tmp = tmp->next;
		tmp->next = new;
	}
	else
		*alst = new;
}

t_list	*list_new(void *data)
{
	t_list		*lst;

	if (!(lst = malloc(sizeof(t_list))))
		return (NULL);
	lst->data = data;
	lst->next = NULL;
	printf("cc\n");
	return (lst);
}

int		list_size(t_list *lst)
{
	int		count;
	t_list	*tmp;

	tmp = lst;
	count = 0;
	while (tmp)
	{
		tmp = tmp->next;
		count++;
	}
	return (count);
}

int		list_size_test(int lst_num)
{
	t_list	*list;

	list = NULL;
	while (lst_num--)
		list_add_back(&list, list_new(&lst_num));
	if (list_size(list) == ft_list_size(list))
		printf("" GREEN "[OK] " RESET "");
	else
		printf("" RED "[KO] " RESET "");
	return (1);
}

void	print_list(t_list *list)
{
	t_list	*tmp;

	tmp = list;
	while (tmp)
	{
		printf("%p\n", tmp->data);
		tmp = tmp->next;
	}
}

int cmp_int(void *a, void *b)
{
	return *(int*)a - *(int*)b;
}

int     list_sort_test()
{
    t_list	*list;

	list = NULL;
	printf("LIST SORT\n");

    list_add_back(&list, list_new((void *)98));
    list_add_back(&list, list_new((void *)12));
    list_add_back(&list, list_new((void *)12));
	list_add_back(&list, list_new((void *)45));
    list_add_back(&list, list_new((void *)1));
    list_add_back(&list, list_new((void *)-1));
	list_add_back(&list, list_new((void *)232));
    list_add_back(&list, list_new((void *)34));
    list_add_back(&list, list_new((void *)23));
	//45 1 -1 232 34 23
    //list_add_back(&list, list_new(strdup("1")));
    //list_add_back(&list, list_new(strdup("4")));
    //list_add_back(&list, list_new(strdup("6")));
    //list_add_back(&list, list_new(strdup("3")));
    //list_add_back(&list, list_new(strdup("8")));
    //list_add_back(&list, list_new(strdup("3")));
    print_list(list);
    printf("_________________________\n");
    printf("%d\n", ft_list_sort(&list, cmp_int));
    print_list(list);
    return(1);
}

int     list_push_front_test()
{
    t_list	*list;

	list = NULL;
    //list_add_back(&list, list_new(strdup("1")));
    //list_add_back(&list, list_new(strdup("5")));
    //list_add_back(&list, list_new(strdup("6")));
    list_add_back(&list, list_new(strdup("8")));
    printf("PUSH FRONT TEST\n");
    print_list(list);
    printf("___________________\n");
    printf("%d\n",ft_list_push_front(&list, strdup("1")));
    //ft_list_push_front(&list, (void *)8);
    print_list(list);
    return(1);
}

int     list_remove_if_test()
{
    t_list	*list;

	list = NULL;
    list_add_back(&list, list_new(strdup("5")));
    list_add_back(&list, list_new(strdup("1")));
    list_add_back(&list, list_new(strdup("6")));
    list_add_back(&list, list_new(strdup("8")));
    list_add_back(&list, list_new(strdup("7")));
    printf("\nREMOVE IF TEST\n");
    print_list(list);
    printf("___________________\n");
    printf("%d\n", ft_list_remove_if(&list, strdup("7"), &strcmp));
    print_list(list);
    return(1);
}

void    atoi_base_test()
{
        printf("\n\n atoi base : %d\n", ft_atoi_base("-345", "0123456789"));
}

int main(void)
{
    ft_check_strlen();
    check_strcmp("HEllo", "hello");
    strdup_test("");
    strdup_test("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tellus metus, finibus quis sagittis quis, volutpat a justo. Nunc et pellentesque quam. Fusce aliquam aliquam libero, sed pulvinar nullam.");

	strdup_test("allo \0 mon bars");
    strcpy_test("cocu\n");
    printf("%-16s :  ", "ft_list_size.s");
	list_size_test(0);
	list_size_test(8);
	list_size_test(1);
	list_size_test(16);

    list_push_front_test();

    list_remove_if_test();

    list_sort_test();

    atoi_base_test();
	printf("\n\n");
    //check_strcpy();
    return(1);
}